# Written by graefchen
# based on: uiua 0.11.1
# link: https://github.com/uiua-lang/uiua

# Initialize a new main.ua file
export extern "uiua init" [
	--help(-h) # Print help
]

# Format and run a file
export extern "uiua run" [
	path?: string
	--no-format             # Don't format the file before running
	--no-color              # Don't colorize stack output
	--format-config: string # Select the formatter configuration source (one of search-file, default, or a path to a fmt.ua file)
	--time-instrs           # Emit the duration of each instruction's execution
	--mode: string          # Run the file in a specific mode
	--help(-h)              # Print help
]

# Build an assembly (the .uasm format is currently unstable)
export extern "uiua build" [
	path?: string
	--output(-o) # The path to the output file
	--help(-h)   # Print help
]

# Evaluate an expression and print its output
export extern "uiua eval" [
	code: string
	--no-color # Don't colorize stack output
	--help(-h) # Print help
]

# Format and test a file
export extern "uiua test" [
	path?: string
	--format-config: string # Select the formatter configuration source (one of search-file, default, or a path to a fmt.ua file)
	--help(-h)              # Print help
]

# Run .ua files in the current directory when they change
export extern "uiua watch " [
	args?: string
	--no-format             # Don't format the file before running
	--no-color              # Don't colorize stack output
	--format-config: string # Select the formatter configuration source (one of search-file, default, or a path to a fmt.ua file)
	--clear                 # Clear the terminal on file change
	--stdin-file: string    # Read stdin from file
	--help(-h)              # Print help
]

# Format a Uiua file or all files in the current directory
export extern "uiua fmt" [
	path?: string
	--format-config: string # Select the formatter configuration source (one of search-file, default, or a path to a fmt.ua file)
	--io                    # Format lines read from stdin
	--help(-h)              # Print help
]

# Run the Language Server
export extern "uiua lsp" [
	--help(-h) # Print help
]

# Run the Uiua interpreter in a REPL
export extern "uiua repl" [
	file?: string
	--format-config: string # Select the formatter configuration source (one of search-file, default, or a path to a fmt.ua file)
	--help(-h)              # Print help
]

# Update Uiua by installing with Cargo
export extern "uiua update" [
	--main     # Install from the main branch instead of crates.io
	--check    # Only check for updates
	--help(-h) # Print help

]

# Create a standalone executable
export extern "uiua stand" [
	main?: string
	--name(-o): string # The name of the output executable
	--help(-h)         # Print help
]

def "nu-complete uiua help" [] {
	[
		{ value: "init", description: "Initialize a new main.ua fil" },
		{ value: "run", description: "Format and run a fil" },
		{ value: "build", description: "Build an assembly (the .uasm format is currently unstable" },
		{ value: "eval", description: "Evaluate an expression and print its outpu" },
		{ value: "test", description: "Format and test a fil" },
		{ value: "watch", description: "Run .ua files in the current directory when they change  " },
		{ value: "fmt", description: "Format a Uiua file or all files in the current directory " },
		{ value: "lsp", description: "Run the Language Serve" },
		{ value: "repl", description: "Run the Uiua interpreter in a REP" },
		{ value: "update", description: "Update Uiua by installing with Carg" },
		{ value: "stand", description: "Create a standalone executabl" },
		{ value: "help", description: "Print this message or the help of the given subcommand(s)" }
	]
}

# Print this message or the help of the given subcommand(s)
export extern "uiua help" [
	...command: string@"nu-complete uiua help"
]

# A stack-based array programming language
export extern "uiua" [
	--help(-h)    # Print help
	--version(-v) # Print version
]
