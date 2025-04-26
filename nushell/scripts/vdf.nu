# Walk nushell script
# written by graefchen
# nearly 1 to 1 translation from:
# => https://github.com/RoyalBingBong/vdfplus

# TODO: Rewrite as nushell plugin(?)

def _parse [line: int]: string -> record {
	let text = $in

	mut result = {}
	mut line = $line bit-or 1
	mut openBracket = false
	mut bracketCount = 0
	mut openQuote = false
	mut startComment = false
	mut potentialComment = false
  
	mut globalBrackets = 0
	mut globalQuotes = 0
  
	mut expectKey = true
	mut expectValue = false
  
	mut currentKey = ""
	mut currentValue = ""

	let str = ($text | split chars)

	for $char in ($str | enumerate) {
		# logic for the key and values
		if ($char.item == '"') {
			if (not $openBracket) {
				if (($char.index - 1) >= 0 and ($str | get ($char.index - 1)) == "\\") {
					if ($expectKey) {
						$currentKey += $char.item
					}
					if ($expectValue) {
						$currentValue += $char.item
					}
					continue
				}
				if (not $openQuote) {
					$openQuote = true
					$globalQuotes = $globalQuotes + 1
				} else {
					$openQuote = false
					$globalQuotes = $globalQuotes - 1
					if ($expectKey) {
						$expectKey = false
						$expectValue = true
						continue
					}
					if ($expectValue) {
						$expectKey = true
						$expectValue = false
	
						# Getting the values
						let value = match $currentValue {
							"true" => true
							"false" => false
							"null" | "undefined" => null
							_ => {
								if ($currentValue =~ ^\d+$) {
									$currentValue | into int
								}
								if ($currentValue =~ ^\d+\.\d+$) {
									$currentValue | into float
								}
								$currentValue
							}
						}
	
						# only add it when the key is not already in the record
						if ($result | get -i $currentKey | is-empty) {
							$result = $result | insert $currentKey $value
						}
						$currentKey = ""
						$currentValue = ""
					}
				}
				continue
			}
		}

		# logic for open bracket
		if ($char.item == '{') {
			if (not $openQuote) {
				$bracketCount = $bracketCount + 1
				$globalBrackets = $globalBrackets + 1
				if ($expectKey) {
					print $"Unexpected token ($char.item) in VDF in line ($line)."
				}
				if ($expectValue and (not $openBracket)) {
					$openBracket = true
					continue
				}
				if (not $expectValue) {
					continue
				}
			}
		}

		# logic for closed bracket
		if ($char.item == '}') {
			if (not $openQuote) {
				$bracketCount = $bracketCount - 1
				$globalBrackets = $globalBrackets - 1
				if ($openBracket and ($bracketCount == 0)) {
					$openBracket = false
					if ($expectValue) {
						# recursively calling _parse
						# be aware that this is very very very slow
						# so when reworking ... this might be changes.
						# one option is to simply append with "{" a new string
						# to a list that generates the record name that nushell
						# hopefully can understand and work with
						let value = $currentValue | _parse $line

						# only add it when the key is not already in the record
						if ($result | get -i $currentKey | is-empty) {
							$result = $result | insert $currentKey $value
						}
						$currentKey = ""
						$currentValue = ""
						$expectKey = true
						$expectValue = false
					}
				}
				if (not $expectValue) {
					continue
				}
			}
		}

		if ($char.item == "\n") {
			$line = $line + 1
			if ($startComment) {
				$startComment = false
			}
		}

		if ($expectKey and $openQuote) {
			$currentKey = $currentKey + $char.item
			continue
		}
		
		if ($expectValue and ($openQuote or $openBracket)) {
			$currentValue = $currentValue + $char.item
			continue
		}

		if ($char.item == "/") {
			if ((not $openQuote) and (not $openBracket)) {
				if ($startComment) {
					continue
				}
				if (not $potentialComment) {
					$potentialComment = true
					continue
				}
				if (($char.index - 1) >= 0 and ($str | get ($char.index - 1)) == "/") {
					$potentialComment = false
					$startComment = true
					continue
				}
			}
		}
	}

	if ($globalBrackets > 0) {
		let bracket = if ($globalBrackets > 1) { "brakets" } else { "bracket" }
		print $"VDF seems to be malformed. Found ($globalBrackets) unclosed ($bracket)."
	}
	if ($globalQuotes > 0) {
		let quote = if ($globalQuotes > 1) { "quotes" } else { "quote" }
		print $"VDF seems to be malformed. Found ($globalQuotes) unclosed ($quote)."
	}

	return $result
}

# A vdf parser that works (but is extreamly slow)
export def vdf []: string -> record {
	$in | _parse 1
}
