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
