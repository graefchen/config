# written by graefchen

# TODO: Save links / references in a file to make stuff faster
# TODO: Maybe implement reference links

def links [file: string]: nothing -> list<string> {
	open $file
		# | lines
		# | each { $in | parse --regex '\[.*?\]\((?<link>.*?)\)'}
		| each { $in | parse --regex '\[.*\]\((?<link>.*?)\)'}
		| filter { $in | is-not-empty }
		| flatten
		| get link
		| filter {|x| ( ($x | str starts-with "#") != true ) }
		| sort
		| uniq
	}

def check-links [file: string, links: list<string>]: nothing -> nothing {
	mut count = 0

	for $link in $links {
		if (($link | str starts-with ".") or ($link | str starts-with "./")) {
			continue
		}
		let status = (http get --allow-errors --full $link) | get status

		if (not ($status in 200..299)) {
			print $"File: ($file) • Link: ($link) • (ansi red)Error: ($status)(ansi reset)"
			$count = $count + 1
		} else {
			print $"File: ($file) • Link: ($link) • (ansi green)Working(ansi reset)"
		}
	}

	if ($count > 0) {
		print $"❌ Found (ansi yellow)($count)(ansi reset) dead links 🙀"
	} else {
		print "No dead links found 😸"
	}
}

# get dead links from a markdown file
#
# currently only supports the normal links and not the reference links.
# This command can be slow as it waits for a response before
# sending anpther one, so bad connections can make the program take
# a while to run.
export def main [file: string]: nothing -> nothing {
	if not ( $file | path exists) { return "File does not exist." }
	if not (($file | path type) == "file") { return "File is not a file." }
	# print (links $file)
	check-links $file (links $file)
}
