# Written by graefchen
# Just some miscellaneous apps (small and big)
# Or just as text for the command

# some go apps

# based on: bunnyfetch v0.2.0
# link: https://github.com/Rosettea/bunnyfetch

# Tiny system info fetch utility.
export extern "bunnyfetch" [
	--help(-h)              # help for bunnyfetch
	--no-distro-color(-d)   # don't use the color defined in os-release for the OS color
]

# based on: jqp version 0.7.0
# link: https://github.com/noahgorstein/jqp

def "nu-complete json" [] {
	ls -la **/*.json
	| get name
	| sort -in
}


# jqp is a TUI to explore the jq command line utility
export extern "jqp" [
	--config: string       # path to config file (default is $HOME/.jqp.yaml)
	--file(-f): string@"nu-complete json"     # path to the input JSON file
	--help(-h)             # help for jqp
	--theme(-t): string    # jqp theme
	--version(-v)          # version for jqp
]


# based on: Io 20110905
# link: https://iolanguage.org

def "nu-complete io" [] {
	ls -la **/*.io
	| get name
	| sort -in
}

# Io programmming language
export extern "io" [
	file?: string@"nu-complete io"
]

# Private binaries

# fallout 4 save

def "nu-complete fi" [] {
	ls -la **/*.fos
	| get name
	| sort -in
}

# fallout 4 save inspector
export extern "fi" [] {
	...file:string@"nu-complete fi"
}

alias fa = fi ...(ls -la **/*.fos | get name | sort -in)

# skyrim save

def "nu-complete si" [] {
	ls -la **/*.ess
	| get name
	| sort -in
}

# skyrim save inspector
export extern "si" [] {
	...file:string@"nu-complete si"
}

alias sa = si ...(ls -la **/*.ess | get name | sort -in)

# Commented out (outdated|unwanted) misc items
