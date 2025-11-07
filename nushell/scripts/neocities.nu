# written by graefchen
# the neocities developer api (https://neocities.org/api)
# minimal and only works for me, not general
# DO NO USE WHEN YOU DO NOT KNOW WHAT YOU DO!

def get-api-key []: nothing -> string {
	let file = (open ~/.config/secret.json)
	return (open ~/.config/secret.json | get neocities.api_key)
}

def get-header []: nothing -> list<string>, nothing -> nothing {
	let key = get-api-key
	if ($key | is-empty) { return }
	return ["Authorization" $"Bearer ($key)"]
}

def parse_list []: table -> table {
	$in | each {|x|
		return {
			name: ($x.path | into string),
			type: (if ($x.is_directory == false) {"file"} else {"dir"}),
			size: (if ("size" in ($x|columns)) {$x.size|into filesize} else {0|into filesize}),
			created: ($x.created_at|into datetime)
			modified: ($x.updated_at|into datetime)
			sha1_hash: (if ("sha1_hash" in ($x|columns)) {$x.sha1_hash|into string} else {null})
		}
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
		return (http get --allow-errors --user $user --password $password $"https://neocities.org/api/list?($query)" | get files | parse_list)
	} else {
		let header = (get-header)
		return (http get --allow-errors --headers ($header) $"https://neocities.org/api/list?($query)" | get files | parse_list)
	}
}

def parse_info []: record -> record {
	let input = $in
	return {
		sitename: ($input.sitename | into string),
		views: ($input.views | into int),
		hits: ($input.hits | into int),
		created: ($input.created_at| into datetime),
		modified: ($input.last_updated | into datetime),
		domain: ($input.domain),
		tags: ($input.tags | each {$in|into string}),
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
		return (http get --allow-errors $"https://neocities.org/api/info?sitename=($name)" | get info | parse_info)
	} else {
		if (($user | is-not-empty) and ($password | is-not-empty)) {
			return (http get --allow-errors --user $user --password $password https://neocities.org/api/info | get info | parse_info)
		} else {
			let header = (get-header)
			return (http get --allow-errors --headers ($header) https://neocities.org/api/info | get info | parse_info)
		}
	}
}

# a small neocities command line tool to upload, delete, list, etc.
export def main []: nothing -> any {
	help neocities
}