def leet-encrypt [message]: nothing -> string {
	let chars = ($message | split chars)
	$chars | each {|char|
		match $char {
			"a" => "4"
			"b" => "8"
			"e" => "3"
			"g" => "6"
			"i" => "!"
			"l" => "1"
			"o" => "0"
			"s" => "5"
			"t" => "7"
			"z" => "2"
			_ => $char
		}
	} | str join ""
}

def leet-decrypt [message]: nothing -> string {
	let chars = ($message | split chars)
	$chars | each {|char|
		match $char {
			"4" => "a"
			"8" => "b"
			"3" => "e"
			"6" => "g"
			"!" => "i"
			"1" => "l"
			"0" => "o"
			"5" => "s"
			"7" => "t"
			"2" => "z"
			_ => $char
		}
	} | str join ""
}

def leet [message?: string]: nothing -> string, string -> string {
	let $input = $in
	if (($input | is-empty) and ($message | is-empty)) {
		echo "No input given."
	} else {
		mut msg = $message
		if ($input | is-not-empty) { $msg = $input }
		leet-encrypt $msg
	}
}

def unleet [message?: string]: nothing -> string, string -> string {
	let $input = $in
	if (($input | is-empty) and ($message | is-empty)) {
		echo "No input given."
	} else {
		mut msg = $message
		if ($input | is-not-empty) { $msg = $input }
		leet-decrypt $msg
	}
}
