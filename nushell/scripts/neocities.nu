# written by grafchen
# the neocities developer api (https://neocities.org/api)
# minimal and only works for me, not general
# DO NO USE WHEN YOU DO NOT KNOW WHAT YOU DO!
# TODO: Overwork and make it generally usable.

def get-api-key []: nothing -> string {
	if (not ("~/.config/secret.json" | path exists)) {
		print $"secret.json file does not exist in \".config\" directory"
		return null
	}

	let file = (open ~/.config/secret.json)

	if (not ('neocities' in $file)) {
		print $"neocities value does not exist in the secret.json file."
		return null
	} else {
		return (open ~/.config/secret.json | get neocities.api_key)
	}
}

def get-header []: nothing -> list<string>, nothing -> nothing {
	let key = get-api-key
	if ($key | is-empty) { return }
	return ["Authorization" $"Bearer ($key)"]
}

# Uploads files to your site.
export def "neocities upload" [
	file: string # the name of the file to upload
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
] {
	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http post --allow-errors --content-type multipart/form-data --user $user --password $password https://neocities.org/api/upload { $file: (open -r $file | into binary) })
	} else {
		let header = (get-header)
		if ($header | is-empty) { return }
		return (http post --allow-errors --content-type multipart/form-data --headers ($header) https://neocities.org/api/upload { $file: (open -r $file | into binary) })
	}
}

# Deletes files from your site.
export def "neocities delete" [
	name: string # the name of the file to delete
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
] {
	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http post --allow-errors --user $user --password $password https://neocities.org/api/delete $"filenames[]=($name | url encode)")
	} else {
		let header = (get-header)
		if ($header | is-empty) { return }
		return (http post --allow-errors --headers ($header) https://neocities.org/api/delete $"filenames[]=($name | url encode)")
	}
}

# List all files for your site.
export def "neocities list" [
	path?: string = ""     # The path from which you want to get the list
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
] {
	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http get --allow-errors --user $user --password $password $"https://neocities.org/api/list?path=($path)")
	} else {
		let header = (get-header)
		if ($header | is-empty) { return }
		return (http get --allow-errors --headers ($header) $"https://neocities.org/api/list?path=($path)")
	}
}

# Retreive information about a web site.
export def "neocities info" [
	name?: string # The name of the website
] {
	if ($name | is-not-empty) {
		return (http get --allow-errors $"https://neocities.org/api/info?sitename=($name)")
	} else {
		let header = (get-header)
		if ($header | is-empty) { return }
		return (http get --allow-errors --headers ($header) https://neocities.org/api/info)
	}
}

# Returns an API key that you can use for the API instead of login credentials.
export def "neocities key" [
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
] {
	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http get --allow-errors --user $user --password $password https://neocities.org/api/key)
	} else {
		let header = (get-header)
		if ($header | is-empty) { return }
		return (http get --allow-errors --headers ($header) https://neocities.org/api/key)
	}
}

# a small neofetch command line tool to upload, delete, list, etc.
export def neocities [] {
	help neocities
}
