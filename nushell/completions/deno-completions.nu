# Writtem by greafchen
# TODO: Add missing completions

def "nu-complete deno run" [] {
	ls
	| get name
	| find --regex ".*(\\.(ts|js){1})+$"

}

# Run a JavaScript or TypeScript program
export extern "deno run" [
	command?: string@"nu-complete deno run"
]

# Run a server
export  extern "deno serve" [] {}

# Add dependencies
export  extern "deno add" [] {}

# Run benchmarks
export  extern "deno bench" [] {}

# Bundle module and dependencies into single file
export  extern "deno bundle" [] {}

# Cache the dependencies
export  extern "deno cache" [] {}

# Type-check the dependencies
export  extern "deno check" [] {}

# Compile the script into a self contained executable
export  extern "deno compile" [] {}

# Generate shell completions
export  extern "deno completions" [] {}

# Print coverage reports
export  extern "deno coverage" [] {}

# Show documentation for a module
export  extern "deno doc" [] {}

# Eval script
export  extern "deno eval" [] {}

# Format source files
export  extern "deno fmt" [] {}

# Initialize a new project
export  extern "deno init" [] {}

# Show info about cache or info related to source file
export  extern "deno info " [] {}

# Install script as an executable
export  extern "deno install" [] {}

# Deno kernel for Jupyter notebooks
export  extern "deno jupyter " [] {}

# Uninstall a script previously installed with deno install
export  extern "deno uninstall" [] {}

# Start the language server
export  extern "deno lsp" [] {}

# Lint source files
export  extern "deno lint" [] {}

# Read Eval Print Loop
export  extern "deno repl" [] {}


def "nu-complete deno task" [] {
	open .\deno.json
	| get tasks
	| transpose name command
	| each {|r| { value: $r.name, description: $r.command }}
}

# Run a task defined in the configuration file
export extern "deno task" [
	command?: string@"nu-complete deno task"
]

#Run tests
export extern "test" [] {}

#Print runtime TypeScript declarations
export extern "types" [] {}

#Upgrade deno executable to given version
export extern "upgrade" [] {}

#Vendor remote modules into a local directory
export extern "vendor" [] {}

#Print this message or the help of the given subcommand(s)
export extern "help" [] {}

