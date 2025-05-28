# written by graefchen

# Checks how much cents couls have been spend on monster energy.
#
# Only works for one specific store. And its prices.
def monster [cents: int]: nothing -> record {
	mut ret = {normal:{amount:0,rest:0},sale:{amount:0,rest:0}}

	if ($cents > 124) {
		let rest = $cents mod 124
		let amount = $cents // 124
		$ret = ($ret | update sale {amount:$amount,rest:$rest})
	}

	if ($cents > 174) {
		let rest = $cents mod 174
		let amount = $cents // 174
		$ret = ($ret | update normal {amount:$amount,rest:$rest})
	}

	return $ret
}
