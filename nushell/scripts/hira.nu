# written by graefchen

# transforms romanji to hirigana
export def main [
	romanji?: string # the romanized japanese you want translated
]: nothing -> string, string -> string {
	mut msg = $romanji
	let input = $in
	if ($input | is-not-empty) {$msg = $input}
	if ($msg | is-empty) { return "No input given." }

	let chars = $msg | split chars | str upcase

	mut ret = ""

	let length = $chars | length

	mut i = 0
	# a "simple" for loop made with the loop constraints
	while $i < $length {
		# next_two is for: 
		let next = if ($i + 1) < $length {$chars | get ($i + 1)} else {""}
		let next_two = if (($i + 2) < $length) { $next ++ ($chars | get ($i + 2))} else {""}
		let char = $chars | get $i
		# print $char
		# print $next
		# print $next_two
		match $char {
			"A" => { $ret ++= "あ"}
			"I" => { $ret ++= "い"}
			"U" => { $ret ++= "ぅ"}
			"E" => { $ret ++= "え"}
			"O" => { $ret ++= "お"}
			"K" => {
				match $next {
					"A" => { $ret ++= "か"; $i += 1 }
					"I" => { $ret ++= "き"; $i += 1 }
					"U" => { $ret ++= "く"; $i += 1 }
					"E" => { $ret ++= "け"; $i += 1 }
					"O" => { $ret ++= "こ"; $i += 1 }
				}
			}
			"S" => {
				match $next {
					"A" => { $ret ++= "さ"; $i += 1 }
					"U" => { $ret ++= "す"; $i += 1 }
					"E" => { $ret ++= "せ"; $i += 1 }
					"O" => { $ret ++= "そ"; $i += 1 }
				}
				match $next_two {
					"HI" => { $ret ++= "し"; $i += 2 }
					# here the combination:
					"HA" => { $ret ++= "しゃ"; $i += 2 }
					"HU" => { $ret ++= "しゅ"; $i += 2 }
					"HO" => { $ret ++= "しょ"; $i += 2 }
				}
			}
			"T" => {
				match $next {
					"A" => { $ret ++= "た"; $i += 1 }
					"E" => { $ret ++= "て"; $i += 1 }
					"O" => { $ret ++= "と"; $i += 1 }
				}
				match $next_two {
					"SU" => { $ret ++= "つ"; $i += 2 }
				}
					
			}
			"C" => {
				match $next_two {
					"HI" => { $ret ++= "ち"; $i += 2 }
					# combination
					"HA" => { $ret ++= "ちゃ"; $i += 2 }
					"HU" => { $ret ++= "ちゅ"; $i += 2 }
					"HO" => { $ret ++= "ちょ"; $i += 2 }
				}
			}
			"N" => {
				match $next {
					# we need to increment i for everything where next is a vowel
					# so that it is not read again
					"A" => { $ret ++= "な"; $i += 1 }
					"I" => { $ret ++= "に"; $i += 1 }
					"U" => { $ret ++= "ぬ"; $i += 1 }
					"E" => { $ret ++= "ね"; $i += 1 }
					"O" => { $ret ++= "の"; $i += 1 }
					# assuming next is everything but "AEIOU" so the current must be "N"
					_   => { $ret ++= "ん"}
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "にゃ"; $i += 2 }
					"YU" => { $ret ++= "にゅ"; $i += 2 }
					"YO" => { $ret ++= "にょ"; $i += 2 }
				}
			}
			"H" => {
				match $next {
					"A" => { $ret ++= "は"; $i += 1 }
					"I" => { $ret ++= "ひ"; $i += 1 }
					"U" => { $ret ++= "ふ"; $i += 1 }
					"E" => { $ret ++= "へ"; $i += 1 }
					"O" => { $ret ++= "ほ"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "ひゃ"; $i += 2 }
					"YU" => { $ret ++= "ひゅ"; $i += 2 }
					"YO" => { $ret ++= "ひょ"; $i += 2 }
				}
			}
			"F" => {
				match $next {
					"U" => { $ret ++= "ふ"; $i += 1 }
				}
			}
			"M" => {
				match $next {
					"A" => { $ret ++= "ま"; $i += 1 }
					"I" => { $ret ++= "み"; $i += 1 }
					"U" => { $ret ++= "む"; $i += 1 }
					"E" => { $ret ++= "め"; $i += 1 }
					"O" => { $ret ++= "も"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "みゃ"; $i += 2}
					"YU" => { $ret ++= "みゅ"; $i += 2}
					"YO" => { $ret ++= "みょ"; $i += 2}
				}
			}
			"Y" => {
				match $next {
					"A" => { $ret ++= "や"; $i += 1 }
					"U" => { $ret ++= "ゆ"; $i += 1 }
					"O" => { $ret ++= "よ"; $i += 1 }
				}
			}
			"R" => {
				match $next {
					"A" => { $ret ++= "ら"; $i += 1 }
					"I" => { $ret ++= "り"; $i += 1 }
					"U" => { $ret ++= "る"; $i += 1 }
					"E" => { $ret ++= "れ"; $i += 1 }
					"O" => { $ret ++= "ろ"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "りゃ"; $i += 2 }
					"YU" => { $ret ++= "りゅ"; $i += 2 }
					"YO" => { $ret ++= "りょ"; $i += 2 }
				}
			}
			"W" => {
				match $next {
					"A" => { $ret ++= "わ"; $i += 2 }
					"O" => { $ret ++= "を"; $i += 2 }
				}
			}
			# here start the dakuten ... that are very very complicated
			"G" => {
				match $next {
					"A" => { $ret ++= "が"; $i += 1 }
					"I" => { $ret ++= "ぎ"; $i += 1 }
					"U" => { $ret ++= "ぐ"; $i += 1 }
					"E" => { $ret ++= "げ"; $i += 1 }
					"O" => { $ret ++= "ご"; $i += 1 }
				}
				# combination hiragana
				match $next_two {
					"YA" => { $ret ++= "ぎゃ"; $i += 2 }
					"YU" => { $ret ++= "ぎう"; $i += 2 }
					"YO" => { $ret ++= "ぎょ"; $i += 2 }
				}
			}
			# za = ji (they are both typed the same just the pronounciation is different)
			"Z" => {
				match $next {
					"A" => { $ret ++= "ざ"; $i += 1 }
					"I" => { $ret ++= "じ"; $i += 1 }
					"U" => { $ret ++= "ず"; $i += 1 }
					"E" => { $ret ++= "ぜ"; $i += 1 }
					"O" => { $ret ++= "ぞ"; $i += 1 }
				}
			}
			"J" => {
				match $next {
					"A" => { $ret ++= "ざ"; $i += 1 }
					"I" => { $ret ++= "じ"; $i += 1 }
					"U" => { $ret ++= "ず"; $i += 1 }
					"E" => { $ret ++= "ぜ"; $i += 1 }
					"O" => { $ret ++= "ぞ"; $i += 1 }
				}
				# combination hiragana
				match $next_two {
					"YA" => { $ret ++= "じゃ"; $i += 2 }
					"YU" => { $ret ++= "じゅ"; $i += 2 }
					"YO" => { $ret ++= "じょ"; $i += 2 }
				}
			}
			# this is the T-column kana with dakuten ... very complicated
			"D" => {
				match $next {
					"A" => { $ret ++= "だ"; $i += 1 }
					"I" => { $ret ++= "ぢ"; $i += 1 }
					"U" => { $ret ++= "づ"; $i += 1 }
					"E" => { $ret ++= "で"; $i += 1 }
					"O" => { $ret ++= "ど"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "ぢゃ"; $i += 2 }
					"YU" => { $ret ++= "ぢゅ"; $i += 2 }
					"YO" => { $ret ++= "ぢょ"; $i += 2 }
				}
			}
			"B" => {
				match $next {
					"A" => { $ret ++= "ば"; $i += 1 }
					"I" => { $ret ++= "び"; $i += 1 }
					"U" => { $ret ++= "ぶ"; $i += 1 }
					"E" => { $ret ++= "べ"; $i += 1 }
					"O" => { $ret ++= "ぼ"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "びゃ"; $i += 2 }
					"YU" => { $ret ++= "びゅ"; $i += 2 }
					"YO" => { $ret ++= "びょ"; $i += 2 }
				}
			}
			"P" => {
				match $next {
					"A" => { $ret ++= "ぱ"; $i += 1 }
					"I" => { $ret ++= "ぴ"; $i += 1 }
					"U" => { $ret ++= "ぷ"; $i += 1 }
					"E" => { $ret ++= "ぺ"; $i += 1 }
					"O" => { $ret ++= "ぽ"; $i += 1 }
				}
				# combination
				match $next_two {
					"YA" => { $ret ++= "ぴゃ"; $i += 2 }
					"YU" => { $ret ++= "ぴゅ"; $i += 2 }
					"YO" => { $ret ++= "ぴょ"; $i += 2 }
				}
			}
			# now the combination hiragana...
			"K" => {
				match $next_two {
					"YA" => { $ret ++= "きゃ"; $i += 2 }
					"YU" => { $ret ++= "きゅ"; $i += 2 }
					"YO" => { $ret ++= "きょ"; $i += 2 }
				}
			}
			_   => { $ret ++= $char}
		}
		$i += 1
		# print $ret
	}

	return $ret
}
