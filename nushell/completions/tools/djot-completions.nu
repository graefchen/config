# Written by graefchen

# based on: djot 0.2.1
# link: https://github.com/jgm/djot.lua

# djot, a light markup syntax
export extern "djot" [
	--matches(-m)         # Show matches.
	--ast(-a)             # Show AST.
	--json(-j)            # Use JSON for -m or -a.
	--sourcepos(-p)       # Include source positions in AST.
	--filter(-f): string  # Filter AST using filter in FILE.
	--verbose(-v)         # Verbose (show warnings).
	--version             # Show version information.
	--help(-h)            # Help.
]

# based on: jotdown v0.7.0
# link: https://github.com/hellux/jotdown

# a pull parser for djot, wriiten in rust
export extern "jotdown" [
    --help(-h)       # show this text
    --version(-v)    # show the version number
    --output(-o)     # a file to write the output to. stdout if omitted
    --minified       # emit no whitespace between elements in output
    --indent-string  # string to use as indentation in output, empty by default
    --start-indent   # initial indentation level of output, 0 by default
]
