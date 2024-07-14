# Written by greafchen
# based on hexyl 0.14.0
# link: https://github.com/sharkdp/hexyl

def "nu-completion hexyl color" [] {
	["always" "auto" "never" "force"]
}

def "nu-completion hexyl border" [] {
	["unicode" "ascii" "none"]
}

def "nu-completion hexyl character-table" [] {
	["default" "ascii" "codepage-437"]
}

def "nu-completion hexyl endianness" [] {
	["big" "little"]
}

def "nu-completion hexyl base" [] {
	["binary" "octal" "decimal" "hexadecimal"]
}

# A command-line hex viewer
export extern "hexyl" [
	file?: string
	--length(-m): string                                            # Only read N bytes from the input.
	--bytes(-c): string                                             # An alias for -n/--length
	--skip(-s): string                                              # Skip the first N bytes of the input.
	--block-size:string                                             # Sets the size of the `block` unit to SIZE (default is 512).
	--no-squeezing(-v)                                              # Displays all input data.
	--color: string@"nu-completion hexyl color"                     # When to use colors.
	--border: string@"nu-completion hexyl border"                   # Whether to draw a border with Unicode characters, ASCII characters, or none at all.
	--no-characters                                                 # Do not show the character panel on the right.
	--plain(-p)                                                     # Display output with --no-characters, --no-position, --border=none, and --color=never.
	--characters(-C)                                                # Show the character panel on the right. This is the default, unless --no-characters has been specified.
	--character-table: string@"nu-completion hexyl character-table" # Defines how bytes are mapped to characters.
	--no-position(-P)                                               # Whether to display the position panel on the left.
	--display-offset(-o): string                                    # Add N bytes to the displayed file position.
	--panels: string                                                # Sets the number of hex data panels to be displayed.
	--group-size(-g): number                                        # Number of bytes/octets that should be grouped together.
	--endianness: string@"nu-completion hexyl endianness"           # Whether to print out groups in little-endian or big-endian format. 
	--base(-b): string@"nu-completion hexyl base"                   # Sets the base used for the bytes.
	--terminal-width: number                                        # Sets the number of terminal columns to be displayed.
	--help(-h)                                                      # Print help
	--version(-V)                                                   # Print version
]