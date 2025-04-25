# written by graefchen

# encrypt based on message, key, and alphabet
export def "viginere encrypt" [
	message: string # The message to encrypt
	key: string # The key to encrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	let chars = ($message | split chars)
	let key_chars = ($key | split chars)
	let alphabet_chars = ($alphabet | split chars)
	let key_length = ($key | str length)
	let length = ($alphabet | str length)

	# using the algebraic version from wikipedia
	# M_i = D_K(C_i) = (C_i + K_(i mod m) mod l)
	($chars | enumerate) | each {|x|
		let n = $x.index mod $key_length
		let ki = $alphabet | str index-of ($key_chars | get $n)
		let mi = $alphabet | str index-of $x.item
		if $mi == -1 { return $x.item }
		return ($alphabet_chars | get (($mi + $ki) mod $length))
	} | str join ""
}

# encrypt contents of a file by key and alphabet
export def "viginere encrypt file" [
	file: string # The file to encrypt
	key: string # The key to encrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	viginere encrypt (open $file --raw) $key $alphabet
}

# decrypt based on cipher, key, and alphabet
export def "viginere decrypt" [
	cipher: string # The cipher to decrypt
	key: string # The key to decrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	let chars = ($cipher | split chars)
	let key_chars = ($key | split chars)
	let alphabet_chars = ($alphabet | split chars)
	let key_length = ($key | str length)
	let length = ($alphabet | str length)

	# using the algebraic version from wikipedia
	# M_i = D_K(C_i) = (C_i - K_(i mod m) mod l)
	($chars | enumerate) | each {|x|
		let n = $x.index mod $key_length
		let ki = $alphabet | str index-of ($key_chars | get $n)
		let mi = $alphabet | str index-of $x.item
		if $mi == -1 { return $x.item }
		return ($alphabet_chars | get (($mi - $ki) mod $length))
	} | str join ""
}

# decrypt contents of a file by key and alphabet
export def "viginere decrypt file" [
	file: string # The cipher to decrypt
	key: string # The key to decrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	viginere decrypt (open $file --raw) $key $alphabet
}

# encrypt and decrypt messeges with the Vigenère cipher
#
# It shall be noted that this skips all the unknown letters in the
# message/cipher and key and returns those unknown letters.
export def viginere [] {
	print -n (help viginere)
}
