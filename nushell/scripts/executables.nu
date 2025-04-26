# written by graefchen

# prints ALL executables
export def executables [] {
	$env.Path
	# | filter { |x| ($x | str contains "WINDOWS") == false }
	| each { |x|
		do --ignore-errors {
			ls $x
			| filter { |y| $y.name | str contains ".exe" }
			| get name
		}
	}
	# | flatten
	# | get name
	# | each { |x| $x | split row "\\" | last }
	# | uniq
	# | sort
}
