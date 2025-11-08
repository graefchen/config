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
	download-file $"https://raw.githubusercontent.com/nushell/nu_scripts/main/custom-completions/($correct_name)/($name)-completions.nu" ($env.XDG_CONFIG_HOME | path join $'nushell/completions/extern/($name)-completions.nu' )
}

# downloads all the completions defined in the `completions_list` constant
export def completions []: nothing -> nothing {
	const completions_list = [
		"bat"
		"cargo"
		"curl"
		"gh"
		"git"
		"npm"
		"rg"
		"rustup"
		"vscode"
		"winget"
		"yarn-v4"
	]
	print "Starting to download completions..."
	for i in $completions_list {
		print $"-- ($i)"
		download-completion $i
	}
	print "Finished dowloading completions..."
}

export def rustapps []: nothing -> nothing {
	const rustapps_list = [
		bat
		# coreutils
		fd-find
		hexyl
		hyperfine
		jotdown
		lsd
		numbat-cli
		onefetch
		pastel
		ripgrep
		starship
		tokei
	]
	print "Downloading Rust Apps..."
	for i in $rustapps_list {
		cargo install $i
	}
	print "Finished downloading rustapps..."
}

export def goapps []: nothing -> nothing {
	# Having an different version for anyone is smart
	# as "nap@latest" would simply not work in the up to date way
	# furthermore it could be adjusted to use a specific version
	# for reasons that aren't clear to me yet
	const goapps_list = [
		{ name: "filippo.io/age/cmd/age-keygen", version: "@latest" }
		{ name: "filippo.io/age/cmd/age", version: "@latest" }
		{ name: "github.com/benhoyt/goawk", version: "@latest" }
		{ name: "github.com/benhoyt/goawk", version: "@latest" }
		{ name: "github.com/boyter/scc/v3", version: "@latest" }
		{ name: "github.com/charmbracelet/glow", version: "@latest" }
		{ name: "github.com/charmbracelet/gum", version: "@latest" }
		{ name: "github.com/maaslalani/nap", version: "@main"}
		{ name: "github.com/moulco/moul", version: "@latest" }
		{ name: "github.com/noahgorstein/jqp", version: "@latest" }
		{ name: "github.com/Rosettea/bunnyfetch", version: "@latest" }
		{ name: "github.com/tsoding/snitch", version: "@latest" }
		{ name: "github.com/waynezhang/foto", version: "@latest" }
	]
	print "Downloading Go Apps..."
	for i in $goapps_list {
		print $"-- ($i.name)($i.version)"
		go install ($i.name | append $i.version | str join "")
	}
	print "Finished downloading goapps..."
}

# for adding nupm later ... maybe
# def modules []: nothing -> nothing {}

# An Script that tries to setup my environment ..
export def main []: nothing -> nothing {
	completions
	rustapps
	goapps
}