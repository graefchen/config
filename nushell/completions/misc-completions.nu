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

# jqp is a TUI to explore the jq command line utility
export extern "jqp" [
	--config: string       # path to config file (default is $HOME/.jqp.yaml)
	--file(-f): string     # path to the input JSON file
	--help(-h)             # help for jqp
	--theme(-t): string    # jqp theme
	--version(-v)          # version for jqp
]

# based on: kona-211225
# link: https://github.com/kevinlawler/kona

# kona(k3) programming language
export extern "k" [
	-h: int       # open an HTTP port
	-i: int       # open an IPC port
	-e: string    # execute a string
	-x: string    # execute a string and print
	file?: string # execute a script
]

# based on: Io 20110905
# link: https://iolanguage.org

# Io programmming language
export extern "io" [
	file?: string
]	

# Commented out (outdated|unwanted) misc items
