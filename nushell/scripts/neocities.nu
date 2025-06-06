# written by graefchen
# the neocities developer api (https://neocities.org/api)
# minimal and only works for me, not general
# DO NO USE WHEN YOU DO NOT KNOW WHAT YOU DO!
# TODO: Check the return values of the requests.
# TODO: Correctly parse the values.

const MSG = $"
It seems like you have not an neocities key in your (ansi yellow)$HOME/.config/secret.json(ansi reset) file.
When you do not have any API key from neocities, then you can either generate
one in the https://neocities.org website or use the following command:
(ansi cyan)neocities key(ansi blue) -u(ansi green) YOURUSER(ansi blue) -p(ansi green) YOURPASS(ansi reset)

And the command will return your key.
The API key should be put inside the (ansi yellow)\"neocities\"(ansi reset) object with the name of (ansi yellow)\"api_key\"(ansi reset), it should look like this:
\"(ansi blue)neocities(ansi reset)\": {
	\"(ansi blue)api_key(ansi reset)\": \"(ansi green)YOUR-API-KEY(ansi reset)\"
}"

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

# Uploads files to neocities
#
# Upload a single file at a time.
export def upload [
	...files: string # the names of the files to upload
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
]: nothing -> any {
	# how neocity expects the push to go
	# {name_on_server: <file_object>}
	if ($files | is-empty) { return }
	mut obj = {}
	for $file in $files {
		$obj = $obj | insert ($file | str replace "\\" "/") (open -r $file | into binary)
	}

	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http post --allow-errors --content-type multipart/form-data --user $user --password $password https://neocities.org/api/upload $obj)
	} else {
		let header = (get-header)
		if ($header | is-empty) { return $MSG }
		return (http post --allow-errors --content-type multipart/form-data --headers ($header) https://neocities.org/api/upload $obj)
	}
}

export def "nu-completion-neocities-delete" [] {
	list
	| get files
	| where is_directory == false
	| each { |f| return {value:$f.path, description:$f.created_at}}
}

# Deletes files from neocities - BE CAREFULL WITH IT
#
# All files except "index.html" can be deleted with it.
# And this command only deletes one file at a time.
export def delete [
	...names: string@"nu-completion-neocities-delete" # the name of the file to delete
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
]: nothing -> any {
	let fn = (
		{'filenames[]': ($names | str replace "\\" "/")}
		| url build-query
		| url decode
	)

	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http post --allow-errors --user $user --password $password https://neocities.org/api/delete $fn)
	} else {
		let header = (get-header)
		if ($header | is-empty) { return $MSG }
		return (http post --allow-errors --headers ($header) https://neocities.org/api/delete $fn)
	}
}

# List all files for your neocities site
#
# When given an path, it will only look up the files for the path
# else it would list all files from your site.
export def list [
	path?: string = ""     # The path from which you want to get the list
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
]: nothing -> any {
	let query = ({"path": $path} | url build-query)

	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http get --allow-errors --user $user --password $password $"https://neocities.org/api/list?($query)" | get files)
	} else {
		let header = (get-header)
		if ($header | is-empty) { return $MSG }
		return (http get --allow-errors --headers ($header) $"https://neocities.org/api/list?($query)" | get files)
	}
}

# Retreive information about a neocities web site
#
# When given a name, then it looks up the the informations for the given site,
# else it looks up your websites information, if the api-key or username and
# password are given.
export def info [
	name?: string          # The name of the website
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
]: nothing -> any {
	if ($name | is-not-empty) {
		return (http get --allow-errors $"https://neocities.org/api/info?sitename=($name)" | get info)
	} else {
		if (($user | is-not-empty) and ($password | is-not-empty)) {
			return (http get --allow-errors --user $user --password $password https://neocities.org/api/info | get info)
		} else {
			let header = (get-header)
			if ($header | is-empty) { return $MSG }
			return (http get --allow-errors --headers ($header) https://neocities.org/api/info | get info)
		}
	}
}

# Returns an neocities API key
#
# Returns an API key that you can use for the API instead of login credentials.
# It will automatically generate a new API key if one doesn't exist yet for your site.
export def key [
	--user(-u): string     # Your Username
	--password(-p): string # Your Password
]: nothing -> any {
	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http get --allow-errors --user $user --password $password https://neocities.org/api/key | get api_key)
	} else {
		let header = (get-header)
		if ($header | is-empty) { return $MSG }
		return (http get --allow-errors --headers ($header) https://neocities.org/api/key | get api_key)
	}
}

# a small neocities command line tool to upload, delete, list, etc.
export def main []: nothing -> any {
	help neocities
}
