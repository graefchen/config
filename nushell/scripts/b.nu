# move the specified file(s) into the bin folder
export def main [...files: path] {
	$files | each { mv $in ($env.HOMEPATH | path join "bin")}
}
