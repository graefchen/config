export def l [] {
	ls ($env.HOMEPATH | path join "bin")
	| get name
	| split column "\\"
	| get column3
	| split column "."
	| get column1
}

# move the specified file(s) into the bin folder
export def main [...files: path] {
	for $f in $files {
		mv $f ($env.HOMEPATH | path join "bin")
	}
}
