# written by graefchen

# list all files in the bin folder
def "binary list" [] {
	ls ($env.HOMEPATH | path join "bin")
	| each { $in | update name {|i| $i.name | path parse | get stem } }
}

# move the specified file(s) into the bin folder
def "binary" [...files: path] {
	for $f in $files { mv $f ($env.HOMEPATH | path join "bin") }
}