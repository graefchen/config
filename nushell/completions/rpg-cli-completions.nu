# Written by graefchen
# based on: rpg-cli 1.0.1
# link: https://github.com/facundoolano/rpg-cli

# Display stats for the given items. Defaults to displaying hero stats if no item is specified. [default]
export extern "rpg-cli stat" [
	--quiet(-q)      # Print succinct output when possible
	--plain          # Print machine-readable output when possible
	--help(-h)       # Print help
	...items: string #
]

# Moves the hero to the supplied destination, potentially initiating battles along the way
export extern "rpg-cli cd" [
	--run         # Attempt to avoid battles by running away
	--bribe       # Attempt to avoid battles by bribing the enemy
	--force(-f)   # Move the hero's to a different location without spawning enemies. Intended for scripts and shell integration
	--quiet(-q)   # Print succinct output when possible
	--plain       # Print machine-readable output when possible
	--help(-h)    # Print help
	path?: string # Directory to move to [default: ~]
]

# Inspect the directory contents, possibly finding treasure chests and hero tombstones
export extern "rpg-cli ls" [
	--quiet(-q) # Print succinct output when possible
	--plain     # Print machine-readable output when possible
	--help(-h)  # Print help
]

# Buys an item from the shop. If name is omitted lists the items available for sale
export extern "rpg-cli buy" [
	--quiet(-q)      # Print succinct output when possible
	--plain          # Print machine-readable output when possible
	--help(-h)       # Print help
	...items: string #
]

# Uses an item from the inventory
export extern "rpg-cli use" [
	--quiet(-q)      # Print succinct output when possible
	--plain          # Print machine-readable output when possible
	--help(-h)       # Print help
	...items: string #
]

# Prints the quest todo list
export extern "rpg-cli todo" [
	--quiet(-q) # Print succinct output when possible
	--plain     # Print machine-readable output when possible
	--help(-h)  # Print help
]

# Resets the current game
export extern "rpg-cli reset" [
	--hard      # Reset data files, losing cross-hero progress
	--quiet(-q) # Print succinct output when possible
	--plain     # Print machine-readable output when possible
	--help(-h)  # Print help
]

# Change the character class. If name is omitted lists the available character classes
export extern "rpg-cli class" [
	--quiet(-q)    # Print succinct output when possible
	--plain        # Print machine-readable output when possible
	--help(-h)     # Print help
	class?: string #
]

# Prints the hero's current location
export extern "rpg-cli pwd" [
	--quiet(-q) # Print succinct output when possible
	--plain     # Print machine-readable output when possible
	--help(-h)  # Print help
]

# Potentially initiates a battle in the hero's current location
export extern "rpg-cli battle" [
	--run       # Attempt to avoid battles by running away
	--bribe     # Attempt to avoid battles by bribing the enemy
	--quiet(-q) # Print succinct output when possible
	--plain     # Print machine-readable output when possible
	--help(-h)  # Print help
]


def "nu-complete rpg-cli help" [] {
	[ "stat" "cd" "ls" "buy" "use" "todo" "reset" "class" "pwd" "battle" "help" ]
}


# Print the help message or the help of the given subcommand(s)
export extern "rpg-cli help" [
	...command: string@"nu-complete rpg-cli help" # Print help for the subcommand(s)
]

# Your filesystem as a dungeon!
export extern "rpg-cli" [
	--quiet(-q)   # Print succinct output when possible
	--plain       # Print machine-readable output when possible
	--help(-h)    # Print help
	--version(-V) # Print version
]