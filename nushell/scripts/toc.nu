# written by graefchen

# importing the str repeat function from the standard library
use std repeat

# parsing the lines
def parse-lines [
	min: int
	max: int	
]: list<string> -> list<string> {
	let $input = $in
	let min_string = ("#" | repeat $min | str join)
	let max_string = ("#" | repeat ($max + 1) | str join)

	# Takeing the input.
	# Filtering out the maximum heading level.
	# Filtering out the manimum heading level.
	# Parsing the remaining string into a table.
	# Running an for-each loop over each row in the table to get the:
	# - level
	# - title
	# - link
	# and the creating an string out of it that is returned
	$input
	| filter { not ($in | str starts-with $max_string) }
	| filter { $in | str starts-with $min_string }
	| parse "{level} {name}"
	| each {|x|
		# the level puts the number of space. it is a little bit complicated
		# to describe what it does, but in essence we get the length of the
		# string of '#' and subtract from that the minimum level, to then
		# multiply it with 2, take that number and repeat space to then
		# join the list of spaces together
		# So it does something like this:
		# Assuming the minimum is 2, the maximum 6
		# and therefor "## ...", etc. isn't filtered out:
		# "##"     => 2 => 0 => ""         (0 Spaces)
		# "###"    => 3 => 1 => "  "       (2 Spaces)
		# "####"   => 4 => 2 => "    "     (4 Spaces)
		# "#####"  => 5 => 3 => "      "   (6 Spaces)
		# "######" => 6 => 4 => "        " (8 Spaces)
		let level =  (' '| repeat ((($x.level | str length) - $min ) * 2) | str join)
		let title = $x.name
		# replacing every space with an minus sign
		# it seems to be done like this
		# (for at least for the vscode markdown extension)
		let link = ($x.name | str downcase | str replace --all ' ' '-')

		return $"($level)- [($title)]\(#($link)\)"
	}
}

# parse the text
def parse-text [
	min: int
	max: int
]: string -> string {
	# taking the input, spliting it in a list of strings and then join the list
	# at the end together
	$in
	| lines
	| parse-lines $min $max
	| str join "\n"
}

def levels [] {
	[
		{value: 1, description: "#"},
		{value: 2, description: "##"},
		{value: 3, description: "###"},
		{value: 4, description: "####"},
		{value: 5, description: "#####"},
		{value: 6, description: "######"}
	]
}

# toc - table of contents - generate a table of contents from a markdown(-like) file
#
# We assume that the input is always a correct markdown file-
# Failes on multiple occasions.
# For example if the argument `min` or max is smaller than 0.
# Or when the argument min is bigger than max.
# Or when the argument min is bigger than 6.
# Additionally failes when the given (markdown) file does not exist.
# Or when the give path/file is not a file.
export def main [
	--file(-f): string        # The markdown(-like) file that is used to generate its table of contents
	--min(-m): int@levels = 2 # The minimum heading, between 1 and 6
	--max(-x): int@levels = 3 # The maximum heading, between 1 and 6
]: nothing -> string, string -> string {
	let $input = $in
	if ($input | is-empty) and ($file | is-empty) {
		return "No input given."
	}
	if ($min > $max) { return "Min is bigger than max." }
	if ($min < 0) or ($max < 0) { return "Min or max are under 0." }
	if ($max > 6) { return "Max to big. it should be between 1 and 6."}
	if ($input | is-not-empty) {
		$input | parse-text $min $max
	} else if ($file | is-not-empty) {
		if not ( $file | path exists) { return "File does not exist." }
		if not (($file | path type) == "file") { return "File is not a file." }
		open $file | parse-text $min $max
	}
}
