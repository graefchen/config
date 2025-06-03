# written by graefchen

# list all files in the bin folder
export def "binary list" [] {
	ls ($env.HOMEPATH | path join "bin")
	| get name | path parse | get stem
}

# move the specified file(s) into the bin folder
export def main [...files: path] {
	for $f in $files {
		mv $f ($env.HOMEPATH | path join "bin")
	}
}
