# written by graefchen

def encrypt [
	message: string # The message to encrypt
	key: string # The key to encrypt
	alphabet: string # The used Alphabet
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

def decrypt [
	cipher: string # The cipher to decrypt
	key: string # The key to decrypt
	alphabet: string # The used Alphabet
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

# viginere encrypt
def "viginere encrypt" [
	--message(-m): string # The message to encrypt
	key: string # The key to decrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string, string -> string {
	let $input = $in
	if (($input | is-empty) and ($message | is-empty)) {
		echo "No input given."
	} else {
		mut msg = $message
		if ($input | is-not-empty) { $msg = $input }
		encrypt $msg $key $alphabet
	}
}

# viginere encrypt a file
def "viginere encrypt file" [
	file: string # The file to encrypt
	key: string # The key to encrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	encrypt (open $file --raw) $key $alphabet
	| save -f $file

		echo $"encrypted ($file)"
}

# viginere decrypt
def "viginere decrypt" [
	--cipher(-c): string # the cipher to decrypt
	key: string # The key to decrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string, string -> string {
	let $input = $in
	if (($input | is-empty) and ($cipher | is-empty)) {
		echo "No input given."
	} else {
		mut msg = $cipher
		if ($input | is-not-empty) { $msg = $input }
		encrypt $msg $key $alphabet
	}
}

# viginere decrypt a file
def "viginere decrypt file" [
	file: string # The cipher to decrypt
	key: string # The key to decrypt
	alphabet: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" # The used Alphabet
]: nothing -> string {
	decrypt (open $file --raw) $key $alphabet
	| save -f $file

	echo $"decrypted ($file)"
}

# encrypt and decrypt messeges with the Vigenère cipher
#
# It shall be noted that this skips all the unknown letters in the
# message/cipher and key and returns those unknown letters.
def viginere [] {
	print -n (help viginere)
}
