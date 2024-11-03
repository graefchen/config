# Written by graefchen
# based on: purs 0.15.15
# link: https://www.purescript.org

# Compile PureScript source files
export extern "purs compile" [
	--help(-h)                  # Show this help text
	GLOB: string                # A glob for input .purs file(s).
	--source-globs-file: string # A file containing a line-separated list of input.purs globs.
	--exclude-files(-x): string # A glob of .purs files to exclude from the input .purs files.
	--output(-o): string        # The output directory (default: "output")
	--verbose-errors(-v)        # Display verbose error messages
	--comments(-c)              # Include comments in the generated code
	--codegen(-g): string       # Specifies comma-separated codegen targets to include.  Accepted codegen targets are 'corefn', 'docs', 'js',  'sourcemaps'. The default target is 'js', but if this  option is used only the targets specified will be  used.
	--no-prefix(-p)             # Do not include comment header
	--json-errors               # Print errors to stderr as JSON
]

# Generate documentation from PureScript source files in a variety of formats, including Markdown and HTML
export extern "purs docs" [
	--help(-h)                  # Show this help text
	--format: string            # Set output FORMAT (markdown | html | etags | ctags)    
	--output(-o): string        # File/directory path for docs to be written to
	--compile-output: string    # Compiler output directory (default: "output")
	GLOB: string                # A glob for input .purs file(s).
	--source-globs-file: string # A file containing a line-separated list of input.purs globs.
	--exclude-files(-x): string # A glob of .purs files to exclude from the input .purs files.
]

# Module dependency graph
export extern "purs graph" [
	--help(-h)                  # Show this help text
	GLOB?: string               # A glob for input .purs file(s).
	--source-globs-file: string # A file containing a line-separated list of input .purs globs.
	--exclude-files(-x):string  # A glob of .purs files to exclude from the input .purs files.
	--json-errors               # Print errors to stderr as JSON
]

# Generate a GraphViz directed graph of PureScript type classes
export extern "purs hierarchy" [
	--help(-h)           # Show this help text
	FILE?: string        # The input file to generate a hierarchy from (default: "main.purs")
	--output(-o): string # The output directory
]

# Start or query an IDE server process
export extern "purs ide" [
	--help(-h) # Show this help text
]

def "nu-complete purs ide server" [] {
	["debug" "perf" "all" "none"]
}

# Start a server process
export extern "purs ide server" [
	GLOB?: string                                    # A glob for input .purs file(s).
	--source-globs-file: string                      # A file containing a line-separated list of input.purs globs.
	--exclude-files(-x): string                      # A glob of .purs files to exclude from the input .purs files.
	--output-directory: string
	--port(-p): string
	--log-level:string@"nu-complete purs ide server" # One of "debug", "perf", "all" or "none"
	--editor-mode
	--no-watch
	--polling
	--help(-h)                                       # Show this help text
]

# Connect to a running server
export extern "purs ide client" [
	--port(-p): string
	--help(-h) # Show this help text
]

# Generates documentation packages for upload to Pursuit
export extern "purs publish" []

# Enter the interactive mode (PSCi)
export extern "purs repl" [
	--help(-h)                  # Show this help text
	GLOB?: string               # A glob for input .purs file(s).
	--source-globs-file: string # A file containing a line-separated list of input .purs globs.
	--exclude-files(-x): string # A glob of .purs files to exclude from the input .purs files.
	--port(-p): string          # The browser REPL backend was removed in v0.15.0. Use https://try.purescript.org instead.
	--node-path: string         # Path to the Node executable
	--node-opts: string         # Flags to pass to node, separated by spaces
]

# The PureScript compiler and tools
export extern "purs" [
	--version # Show the version number
	--help(-h) # Show this help text
]
