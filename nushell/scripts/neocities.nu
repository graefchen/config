# written by graefchen
# the neocities developer api (https://neocities.org/api)
# minimal and only works for me, not general
# DO NO USE WHEN YOU DO NOT KNOW WHAT YOU DO!

module nc-helper {
	def get-api-key []: nothing -> string {
		let file = (open ~/.config/secret.json)
		return (open ~/.config/secret.json | get neocities.api_key)
	}

	export def get-header []: nothing -> list<string>, nothing -> nothing {
		let key = get-api-key
		if ($key | is-empty) { return }
		return ["Authorization" $"Bearer ($key)"]
	}

	export def parse-list []: table -> table {
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

	export def parse-info []: record -> record {
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
}

use nc-helper

# list all files for your neocities site
#
# When given an path, it will only look up the files for the path
# else it would list all files from your site.
def "neocities list" [
	path?: string = ""     # the path from which you want to get the list
	--user(-u): string     # your Username
	--password(-p): string # your Password
]: nothing -> any {
	let query = ({"path": $path} | url build-query)

	if (($user | is-not-empty) and ($password | is-not-empty)) {
		return (http get --allow-errors --user $user --password $password $"https://neocities.org/api/list?($query)" | get files | nc-helper parse-list)
	} else {
		let header = (nc-helper get-header)
		return (http get --allow-errors --headers ($header) $"https://neocities.org/api/list?($query)" | get files | nc-helper parse-list)
	}
}

# retrieve information about a neocities web site
#
# When given a name, then it looks up the the informations for the given site,
# else it looks up your websites information, if the api-key or username and
# password are given.
export def "neocities info" [
	name?: string          # the name of the website
	--user(-u): string     # your Username
	--password(-p): string # your Password
]: nothing -> any {
	if ($name | is-not-empty) {
		return (http get --allow-errors $"https://neocities.org/api/info?sitename=($name)" | get info | nc-helper parse-info)
	} else {
		if (($user | is-not-empty) and ($password | is-not-empty)) {
			return (http get --allow-errors --user $user --password $password https://neocities.org/api/info | get info | nc-helper parse-info)
		} else {
			let header = (nc-helper get-header)
			return (http get --allow-errors --headers ($header) https://neocities.org/api/info | get info | nc-helper parse-info)
		}
	}
}

# a small neocities command line tool
export def "neocities" []: nothing -> any {
	help neocities
}