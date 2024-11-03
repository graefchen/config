# Written by graefchen
# based on: starship 1.20.1
# link: https://github.com/starship/starship

# Create a pre-populated GitHub issue with information about your configuration
export extern "starship bug-report" [
	--help(-h) # Print help
]

def "nu-complete starship completions" [] {
	[ "bash" "elvish" "fish" "powershell" "zsh" ]
}

# Generate starship shell completions for your shell to stdout
export extern "starship completions" [
	shell: string@"nu-complete starship completions"
	--help(-h)                                       # Print help
]

# Edit the starship configuration
export extern "starship config" [
	name?: string  # Configuration key to edit
	value?: string # Value to place into that key
	--help(-h)     # Print help
]

# Explains the currently showing modules
export extern "starship explain" [
	--status(-s): int          # The status code of the previously run command as an unsigned or signed 32bit integer
	--pipestatus: int          # Bash, Fish and Zsh support returning codes for each process in a pipeline
	--terminal-width(-w): int  # The width of the current interactive terminal [default: 110]
	--path(-p): string         # The path that the prompt should render for
	--logical-path(-P): string # The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument
	--cmd-duration(-d): int    # The execution duration of the last command, in milliseconds
	--keymap(-k): string       # The keymap of fish/zsh/cmd [default: viins]
	--jobs(-j): int            # The number of currently running jobs [default: 0]
	-h, --help                 # Print help
]

# Prints the shell function used to execute starship
export extern "starship init" [
	shell: string
	--print-full-init
	--help(-h) # Print help
]

# Prints a specific prompt module
export extern "starship module" [
	name?: string              # The name of the module to be printed
	--list(-l)                 # List out all supported modules
	--status(-s): int          # The status code of the previously run command as an unsigned or signed 32bit integer
	--pipestatus: int          # Bash, Fish and Zsh support returning codes for each process in a pipeline
	--terminal-width(-w): int  # The width of the current interactive terminal [default: 110]
	--path(-p): string         # The path that the prompt should render for
	--logical-path(-P): string # The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument
	--cmd-duration(-d): int    # The execution duration of the last command, in milliseconds
	--keymap(-k): string       # The keymap of fish/zsh/cmd [default: viins]
	--jobs(-j): int            # The number of currently running jobs [default: 0]
	-h, --help                 # Print help
]

def "nu-complete starship preset" [] {
	[ "bracketed-segments" "gruvbox-rainbow" "jetpack" "nerd-font-symbols" "no-empty-icons" "no-nerd-font" "no-runtime-versions" "pastel-powerline" "plain-text-symbols" "pure-preset" "tokyo-night" ]
}

# Prints a preset config
export extern "starship preset" [
	name?: string@"nu-complete starship preset" # The name of preset to be printed
	--output(-o): string                        # Output the preset to a file instead of stdout
	--list(-l)                                  # List out all preset names
	--help(-h)                                  # Print help
]

# Prints the computed starship configuration
export extern "starship print-config" [
	--default(-d)   # Print the default instead of the computed config
	--help(-h)      # Print help
	...name: string #  Configuration keys to print
]

# Prints the full starship prompt
export extern "starship prompt" [
	--right                    # Print the right prompt (instead of the standard left prompt)
	--profile: string          # Print the prompt with the specified profile name (instead of the standard left prompt)
	--continuation             # Print the continuation prompt (instead of the standard left prompt)
	--status(-s): int          # The status code of the previously run command as an unsigned or signed 32bit integer
	--pipestatus: int          # Bash, Fish and Zsh support returning codes for each process in a pipeline
	--terminal-width(-w): int  # The width of the current interactive terminal [default: 110]
	--path(-p): string         # The path that the prompt should render for
	--logical-path(-P): string # The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument
	--cmd-duration(-d): int    # The execution duration of the last command, in milliseconds
	--keymap(-k): string       # The keymap of fish/zsh/cmd [default: viins]
	--jobs(-j): int            # The number of currently running jobs [default: 0]
	-h, --help                 # Print help
]

# Generate random session key
export extern "starship session" [
	-h, --help # Print help
]

# Prints timings of all active modules
export extern "starship timings" [
	--status(-s): int          # The status code of the previously run command as an unsigned or signed 32bit integer
	--pipestatus: int          # Bash, Fish and Zsh support returning codes for each process in a pipeline
	--terminal-width(-w): int  # The width of the current interactive terminal [default: 110]
	--path(-p): string         # The path that the prompt should render for
	--logical-path(-P): string # The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument
	--cmd-duration(-d): int    # The execution duration of the last command, in milliseconds
	--keymap(-k): string       # The keymap of fish/zsh/cmd [default: viins]
	--jobs(-j): int            # The number of currently running jobs [default: 0]
	-h, --help                 # Print help
]

# Toggle a given starship module
export extern "starship toggle" [
	name: string    # The name of the module to be toggled
	toggle?: string # The key of the config to be toggled [default: disabled]
	--help(-h)      # Print help
]

def "nu-complete starship help" [] {
	[
		{ value: "bug-report", description: "Create a pre-populated GitHub issue with information about your configuration" },
		{ value: "completions", description: "Generate starship shell completions for your shell to stdout" },
		{ value: "config", description: "Edit the starship configuration" },
		{ value: "explain", description: "Explains the currently showing modules" },
		{ value: "init", description: "Prints the shell function used to execute starship" },
		{ value: "module", description: "Prints a specific prompt module" },
		{ value: "preset", description: "Prints a preset config" },
		{ value: "print-config", description: "Prints the computed starship configuration" },
		{ value: "prompt", description: "Prints the full starship prompt" },
		{ value: "session", description: "Generate random session key" },
		{ value: "timings", description: "Prints timings of all active modules" },
		{ value: "toggle", description: "Toggle a given starship module" },
		{ value: "help", description: "Print this message or the help of the given subcommand(s)" }
	]
}

# Print this message or the help of the given subcommand(s)
export extern "starship help" [
	...command: string@"nu-complete starship help" # Print help for the subcommand(s)
]

# The cross-shell prompt for astronauts. ☄🌌️
export extern "starship" [
	--help(-h)    # Print help
	--version(-V) # Print version
]
