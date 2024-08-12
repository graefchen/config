# Written by graefchen
# based on: Fennel 1.5.0
# link: https://fennel-lang.org

# Run Fennel, a Lisp programming language for the Lua runtime.
export extern "fennel" [
	--repl                      # Command to launch an interactive REPL session
	--compile(-c): string       # Command to AOT compile files, writing Lua to stdout
	--eval(-e): string          # Command to evaluate source code and print result
	--correlate                 # Make Lua output line numbers match Fennel input
	--load(-l): string          # Load the specified FILE before executing command
	--no-compiler-sandbox       # Don't limit compiler environment to minimal sandbox
	--compile-binary: string    # Compile FILE to standalone binary OUT
	--compile-binary            # Display further help for compiling binaries
	--add-package-path: string  # Add PATH to package.path for finding Lua modules
	--add-package-cpath: string # Add PATH to package.cpath for finding Lua modules
	--add-fennel-path: string   # Add PATH to fennel.path for finding Fennel modules
	--add-macro-path: string    # Add PATH to fennel.macro-path for macro modules
	--globals: string           # Allow these globals in addition to standard ones
	--globals-only: string      # Same as above, but exclude standard ones
	--assert-as-repl            # Replace assert calls with assert-repl
	--require-as-include        # Inline required modules in the output
	--skip-include: string      # Omit certain modules from output when included
	--use-bit-lib               # Use LuaJITs bit library instead of operators
	--metadata                  # Enable function metadata, even in compiled output
	--no-metadata               # Disable function metadata, even in REPL
	--lua: string               # Run in a child process with LUA_EXE
	--plugin: string            # Activate the compiler plugin in FILE
	--raw-errors                # Disable friendly compile error reporting
	--no-searcher               # Skip installing package.searchers entry
	--no-fennelrc               # Skip loading ~/.fennelrc when launching REPL
	--keywords: string          # Treat these symbols as reserved Lua keywords
	--help(-h)                  # Display this text
	--version(-v)               # Show version
	file?: string
]
