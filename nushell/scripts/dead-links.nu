# written by graefchen

# TODO: Save links / references in a file to make stuff faster
# TODO: Maybe implement reference links

def links [file: string]: nothing -> list<string> {
	open $file
		# | lines
		# | each { $in | parse --regex '\[.*?\]\((?<link>.*?)\)'}
		| each { $in | parse --regex '\[.*\]\((?<link>.*?)\)'}
		| where { $in | is-not-empty }
		| flatten
		| get link
		| where {|x| ( ($x | str starts-with "#") != true ) }
		| sort
		| uniq
}

def check-links [file: string, links: list<string>]: nothing -> number {
	mut count = 0

	for $link in $links {
		let scheme = try {($link | url parse | get scheme)} catch {""}
		if (not ($scheme =~ "http")) {
			continue
		}
		# TODO: Maybe add way to get the Error Message ...
		let status = try {
			(http get --allow-errors --full $link) | get status
		} catch { 530 } # Note: Site is frozen, Origin DNS Error (Shopify), Origin Unavailable (Cloudflare)

		if (not ($status in 200..299)) {
			print $"File: ($file) • Link: ($link) • (ansi red)Error: ($status)(ansi reset)"
			$count = $count + 1
		} else {
			print $"File: ($file) • Link: ($link) • (ansi green)Working(ansi reset)"
		}
	}

	return $count
}

# get dead links from markdown files
#
# currently only supports the normal links and not the reference links.
# This command can be slow as it waits for a response before
# sending anpther one, so bad connections can make the program take
# a while to run.
export def main [...files: string]: nothing -> string {
	mut count = 0
	if ($files | is-not-empty) {
		for file in $files  {
			if not ( $file | path exists) { return $"File \"($file)\" does not exist." }
			if not (($file | path type) == "file") { return "File \"($file)\" is not a file." }
			# print (links $file)
			$count = (check-links $file (links $file)) + $count
		}
	}

	if ($count > 0) {
		print $"❌ Found (ansi yellow)($count)(ansi reset) dead links 🙀"
	} else {
		print "No dead links found 😸"
	}
}