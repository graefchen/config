# written by graefchen

# Returns a random argument out of the argument list
# or out of the given input
export def main [
	...args: any # The arguments which are used to return one at random
]: list<any> -> any, nothing -> any {
	let $input = $in
	if ($input | is-not-empty) == true {
		let max = $input | length
		if $max != 0 {
			let index = (random int 1..$max) - 1
			 return ($input | get $index)
		}
	} else if ($args | is-not-empty) == true {
		let max = ($args | length)
		if $max <= 0 {
			let index = (random int 1..$max) - 1
			return ($args | get $index)
		}
	}
}
