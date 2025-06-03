# written by graefchen

def direction [
	number: int
	message: string
	alphabet: string
]: string -> string, nothing -> string {
	let chars = ($message | split chars)
	let alphabet_chars = ($alphabet | split chars)
	let length = ($alphabet | str length)

	($chars | enumerate) | each {|x|
		let index = $alphabet | str index-of $x.item
		if $index != -1 {
			return ($alphabet_chars | get (($index + $number) mod $length))
		} else {
			return $x.item
		}
	} | str join
}

# small ceasar cipher command
#
# skips all letters that aren't in the alphabet
export def main [
	--decrypt(-d) # decypt 
	--encrypt(-e) # encrypt
	--number(-n): int = 3 # the amount by which the message is rotated
	--alphabet(-a): string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # the usabel alphabet
	message?: string # the message to encrypt/decrypt
]: string -> string, nothing -> string {
	mut msg = $message
	let input = $in
	if ($input | is-not-empty) {
		$msg = $input
	}

	if $decrypt {
		return (direction ($number) $msg $alphabet)
	} else if $encrypt {
		return (direction (0 - $number) $msg $alphabet)
	} else {
		help ceasar
	}
}
