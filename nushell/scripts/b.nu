# written by graefchen

# list all files in the bin folder
export def "b l" [] {
	ls ($env.HOMEPATH | path join "bin")
	| get name | path parse | get stem
}

# move the specified file(s) into the bin folder
export def b [...files: path] {
	for $f in $files {
		mv $f ($env.HOMEPATH | path join "bin")
	}
}
