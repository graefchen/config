# Written by graefchen
# based on: tig 2.5.10 
# link: https://github.com/jonas/tig

# Start up in log view, displaying git-log(1) output.
export extern "tig log" [
	--help(-h) # Show help message and exit.
]

# Open diff view using the given git-show(1) options.
export extern "tig show" [
	--help(-h) # Show help message and exit.
]

# Start up in reflog view.
export extern "tig reflog" [
	--help(-h) # Show help message and exit.
]

# Show given file annotated by commits. Takes zero or more git-blame(1) options. Optionally limited from given revision.
export extern "tig blame" [
	--help(-h) # Show help message and exit.
]

# Open the grep view. Supports the same options as git-grep(1).
export extern "tig grep" [
	--help(-h) # Show help message and exit.
]

# Start up in refs view.
export extern "tig refs" [
	--help(-h) # Show help message and exit.
]

# Start up in stash view.
export extern "tig stash" [
	--help(-h) # Show help message and exit.
]

# Start up in status view.
export extern "tig status" [
	--help(-h) # Show help message and exit.
]

# tig (git text user interface)
export extern "tig" [
	--version(-v) # Show version and exit.
	--help(-h)    # Show help message and exit.
	-C: path      # Run as if Tig was started in <path> instead of the current working directory.
]
