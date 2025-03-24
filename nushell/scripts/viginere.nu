# written by graefchen

export def "viginere encrypt" [
	message: string
	key: string
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
]: nothing -> string {
	let chars = ($message | str upcase | split chars)
	let key_chars = ($key | split chars)
	let alphabet_chars = ($alphabet | split chars)
	let key_length = ($key | str length)
	let length = ($alphabet | str length)

	# using the alhebraic version from wikipedia
	# M_i = D_K(C_i) = (C_i + K_(i mod m) mod l)
	($chars | enumerate) | each {|x|
		let n = $x.index mod $key_length
		let ki = $alphabet | str index-of ($key_chars | get $n)
		let mi = $alphabet | str index-of $x.item
		return ($alphabet_chars | get (($mi + $ki) mod $length))
	} | str join ""
}

export def "viginere decrypt" [
	cipher: string
	key: string
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
]: nothing -> string {
	let chars = ($cipher | str upcase | split chars)
	let key_chars = ($key | split chars)
	let alphabet_chars = ($alphabet | split chars)
	let key_length = ($key | str length)
	let length = ($alphabet | str length)

	# using the alhebraic version from wikipedia
	# M_i = D_K(C_i) = (C_i - K_(i mod m) mod l)
	($chars | enumerate) | each {|x|
		let n = $x.index mod $key_length
		let ki = $alphabet | str index-of ($key_chars | get $n)
		let mi = $alphabet | str index-of $x.item
		return ($alphabet_chars | get (($mi - $ki) mod $length))
	} | str join ""
}

# The Vigenère cipher
#
# encrypt and decrypt strings of it
export def main [] {
	print -n (help viginere)
}
