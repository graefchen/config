# written by graefchen

def download-file [
	source: string,
	name: path,
]: nothing -> nothing {
	http get $source | save -f $name
}

def download-completion [
	name: path,
]: nothing -> nothing {
	let correct_name = ($name | split row "-" | first)
	download-file $"https://raw.githubusercontent.com/nushell/nu_scripts/main/custom-completions/($correct_name)/($name)-completions.nu" ($env.XDG_CONFIG_HOME | path join $'nushell/completions/($name)-completions.nu' )
}

# downloads all the completions defined in the `completions_list` constant
def completions []: nothing -> nothing {
	const completions_list = [
		"bat" "cargo" "curl" "gh" "git" "npm" "rg" "rustup" "vscode" "yarn-v4"
	]
	print "Starting to download completions..."
	for i in $completions_list {
		print $"-- ($i)"
		download-completion $i
	}
	print "Finished dowloading completions..."
}

def rustapps []: nothing -> nothing {
	const rustapps_list = ["bat" "fd-find" "hexyl" "hyperfine" "lsd" "numbat-cli" "onefetch" "pastel" "ripgrep" "starship" "tokei" "uiua"]
	print "Downloading Rust Apps..."
	for i in $rustapps_list {
		cargo install $i
	}
	print "Finished downloading rustapps..."
}

def goapps []: nothing -> nothing {
	const goapps_list = ["github.com/Rosettea/bunnyfetch" "github.com/noahgorstein/jqp" "github.com/maaslalani/nap"]
	print "Downloading Go Apps..."
	for i in $goapps_list {
		print $"-- ($i)"
		go install ($i | append "@latest" | str join "")
	}
	print "Finished donwloading goapps..."
}

# for adding nupm later ... maybe
# def modules []: nothing -> nothing {}

# An Script that tries to setup my environment ..
export def main []: {
	completions
	rustapps
	goapps
}