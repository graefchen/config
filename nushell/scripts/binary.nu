# written by graefchen

# list all files in the bin folder
export def list [] {
	ls ($env.HOMEPATH | path join "bin")
	| each {
		$in | update name {|i| $i.name | path parse | get stem }
	}
}

# move the specified file(s) into the bin folder
export def main [...files: path] {
	for $f in $files {
		mv $f ($env.HOMEPATH | path join "bin")
	}
}