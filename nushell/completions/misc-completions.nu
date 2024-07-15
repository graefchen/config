# Written by graefchen
# Just some miscellaneous apps (small and big)
# Or just as text for the command

# some go apps

# Tiny system info fetch utility.
export extern "bunnyfetch" [
	--help(-h)              # help for bunnyfetch
	--no-distro-color(-d)   # don't use the color defined in os-release for the OS color
]

# jqp is a TUI to explore the jq command line utility
export extern "jqp" [
	--config: string       # path to config file (default is $HOME/.jqp.yaml)
	--file(-f): string     # path to the input JSON file
	--help(-h)             # help for jqp
	--theme(-t): string    # jqp theme
	--version(-v)          # version for jqp
]

# kona(k3) programming language
export extern "k" []

# Io programmming language
export extern "Io" [
	file: path
]

# tig (git text user interface)
export extern "tig" [
	--version(-v)   # Show version and exit
	--help(-h)      # Show help message and exit
	-C: path        # Start in <path>
]

# log
export extern "tig log" [
	--help(-h) # Show help message and exit
]
# show
export extern "tig show" [
	--help(-h) # Show help message and exit
]
# Manage reflog information
export extern "tig reflog" [
	--help(-h) # Show help message and exit
]
# blame
export extern "tig blame" [
	--help(-h) # Show help message and exit
]
# grep
export extern "tig grep" [
	--help(-h) # Show help message and exit
]
# Show references
export extern "tig refs" [
	--help(-h) # Show help message and exit
]
# stash
export extern "tig stash" [
	--help(-h) # Show help message and exit
]
# Show the working tree status
export extern "tig status" [
	--help(-h) # Show help message and exit
]
