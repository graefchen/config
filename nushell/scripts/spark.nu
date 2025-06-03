# Written by graefchen
# Inspired by:
# - https://github.com/deeplook/sparklines
# - https://github.com/nushell/nu_scripts/blob/main/sourced/fun/spark.nu

# sparkline a list of numbers
#
# Takes in a list of numbers and returns the sparkline.
# While it does not really implement correct sparklines
# they are good enough to have some fun with.
export def main [
	value?: list<number> # The list of numbers
]: [
	nothing -> string
	list<number> -> string
] {
	let $input = $in
	let min = ($value | math min)
	let max = ($value | math max)

	# using different blocks depending how min and mas is, so that when there
	# is only one value in the list, we create a constant data with a bigger block
	# mainly because that will look way better than using a smaller block
	# for the constant data
	let BLOCKS = (if $max == $min {["▇" "█"]} else {["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"]})

	# ratio cuts the number into a baseline which is used to get 
	# the correct values, so that 1 2 and 100 only use two different blocks
	# as 7 / (100 - 1) = 0.07 and (2 - 1) * 0.07 rounded is 0 and uses therefor the
	# lowest block while (100 - 1) * 0.07 rounded is 7 and therefor uses the highest block
	# as 0 is the lowest and 7 the highest block
	# uses 1 for when the min and the max are the same, mainly because it looks better
	# and would be because of the calculation of the index not really needed because
	# the element - min will ALWAYS be 0 (and 0 times x will always be 0)
    let ratio = (if $max == $min { 1.0 } else { 7.0 / ($max - $min)})

	let list = (if ($input | is-not-empty) {$input} else {$value})

	if ($list | is-empty ) { echo "No input given." }

	# returning a string
	# after looping through the list we return the correct block
    $list | each { |element|
        let index = ((($element - $min) * $ratio) | math round)
        return ($BLOCKS | get $index)
    } | str join
}
#