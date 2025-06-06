# written by graefchen

# TODO: Save links / references in a file to make stuff faster

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
	}

def check-links [file: string, links: list<string>]: nothing -> nothing {
	mut count = 0

	for $link in $links {
		let status = (http get --allow-errors --full $link) | get status

		if (not ($status in 200..299)) {
			print $"File: ($file) • Link: ($link) • Error: ($status)"
			$count = $count + 1
		} else {
			print $"File: ($file) • Link: ($link) • Working"
		}
	}

	if ($count > 0) {
		print $"❌ Found ($count) dead links 🙀"
	} else {
		print "No dead links found 😸"
	}
}

# get dead links from a markdown file
#
# currently only supports the normal links
# and not the reference links
export def main [file: string]: nothing -> nothing {
	if not ( $file | path exists) { return "File does not exist." }
	if not (($file | path type) == "file") { return "File is not a file." }
	# print (links $file)
	check-links $file (links $file)
}
