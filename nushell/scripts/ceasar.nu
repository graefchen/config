const upper_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const lower_alphabet = "abcdefghijklmnopqrstuvwxyz"

def direction [
	number: int
	message: string
]: string -> string, nothing -> string {
	let chars = ($message | split chars)
	let upper_alphabet_chars = ($upper_alphabet | split chars)
	let lower_alphabet_chars = ($lower_alphabet | split chars)
	let upper_length = ($upper_alphabet | str length)
	let lower_length = ($lower_alphabet | str length)

	($chars | enumerate) | each {|x|
		let upper_index = $upper_alphabet | str index-of $x.item
		let lower_index = $lower_alphabet | str index-of $x.item
		if $upper_index != -1 {
			return ($upper_alphabet_chars | get (($upper_index + $number) mod $upper_length))
		} else if $lower_index != -1 {
			return ($lower_alphabet_chars | get (($lower_index + $number) mod $lower_length))
		} else {
			return $x.item
		}
	} | str join ""
}

# small ceasar cipher command
#
# only works for standard english alphabet, but for capital and lower-case letters.
export def ceasar [
	--decrypt(-d) # decypt 
	--encrypt(-e) # encrypt
	--number(-n): int = 3 # the amount by which the message is rotated
	message?: string # the message to encrypt/decrypt
]: string -> string, nothing -> string {
	mut msg = $message
	let input = $in
	if ($input | is-not-empty) {
		$msg = $input
	}

	if $decrypt {
		return (direction ($number) $msg)
	} else if $encrypt {
		return (direction (0 - $number) $msg)
	} else {
		help ceasar
	}
}
