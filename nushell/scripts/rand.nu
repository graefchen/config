# Returns a random argument out of the argument list
export def main [...args: string]: list<any> -> any, nothing -> any {
	let $input = $in
	if ($input | is-not-empty) == true {
		let max = $input | length
		if $max != 0 {
			let index = (random int 1..$max) - 1
			 return ($input | get $index)
		}
	} else if ($args | is-not-empty) == true {
		let max = ($args | length) - 1
		if $max != 0 {
			let index = (random int 1..$max) - 1
			return ($args | get $index)
		}
	}
}
