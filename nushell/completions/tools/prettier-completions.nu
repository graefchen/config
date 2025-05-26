# written by graefchen
# based on prettier 3.5.4
# link: https://github.com/prettier/prettier

def "nu-complete arrow-parens completions" [] {
	[ "always" "avoid" ]
}

def "nu-complete embedded-language-formatting completions" [] {
	[ "auto" "off" ]
}

def "nu-complete end-of-line completions" [] {
	[ "lf" "crlf" "cr" "auto" ]
}

def "nu-complete experimental-operator-position completions" [] {
	[ "start" "end" ]
}

def "nu-complete html-whitespace-sensitivity completions" [] {
	[ "css" "strict" "ignore" ]
}

def "nu-complete object-wrap completions" [] {
	[ "preserve" "collapse" ]
}

def "nu-complete parser completions" [] {
	[ "flow" "babel" "babel-flow" "babel-ts" "typescript" "acorn" "espree" "meriyah" "css" "less" "scss" "json" "json5" "jsonc" "json-stringify" "graphql" "markdown" "mdx" "vue" "yaml" "glimmer" "html" "angular" "lwc" ]
}

def "nu-complete prose-wrap completions" [] {
	[ "always" "never" "preserve" ]
}

def "nu-complete quote-prose completions" [] {
	[ "as-needed" "consistent" "preserve" ]
}

def "nu-complete trail-comma completions" [] {
	[ "all" "ces5" "none" ]
}

def "nu-complete config-precedence completions" [] {
	[ "cli-override" "file-override" "prefer-file" ]
}

def "nu-complete cache-strategy completions" [] {
	[ "metadata" "content" ]
}

def "nu-complete log-level completions" [] {
	[ "silent" "error" "warn" "log" "debug" ]
}

export extern prettier [
	--check(-c)                                                                                       # Check if the given files are formatted, print a human-friendly summary message and paths to unformatted files (see also --list-different).
	--list-different(-l)                                                                              # Print the names of files that are different from Prettier's formatting (see also --check).
	--write(-w)                                                                                       # Edit files in-place. (Beware!)
	--arrow-parens: string@"nu-complete arrow-parens completions"                                     # Include parentheses around a sole arrow function parameter. Defaults to always.
	--bracket-same-line                                                                               # Put > of opening tags on the last line instead of on a new line. Defaults to false.
	--no-bracket-spacing                                                                              # Do not print spaces between brackets.
	--embedded-language-formatting: string@"nu-complete embedded-language-formatting completions"     # Control how formats quoted code embedded in the file. Defaults to auto.
	--end-of-line: string@"nu-complete end-of-line completions"                                       # Which end of line characters to apply. Defaults to lf.
	--experimental-operator-position: string@"nu-complete experimental-operator-position completions" # Where to print operators when binary expressions wrap lines. Defaults to end.
	--no-experimental-ternaries                                                                       # Default behavior of ternaries; keep question marks on the same line as the consequent.
	--html-whitespace-sensitivity: string@"nu-complete html-whitespace-sensitivity completions"       # How to handle whitespaces in HTML. Defaults to css.
	--jsx-single-quote                                                                                # Use single quotes in JSX. Defaults to false.
	--object-wrap: string@"nu-complete object-wrap completions"                                       # How to wrap object literals. Defaults to preserve.
	--parser: string@"nu-complete parser completions"                                                 # Which parser to use.
	--print-width: int                                                                                # The line length where will try wrap. Defaults to 80.
	--prose-wrap: string@"nu-complete prose-wrap completions"                                         # How to wrap prose. Defaults to preserve.
	--quote-props: string@"nu-complete quote-prose completions"                                       # Change when properties in objects are quoted. Defaults to as-needed.
	--no-semi                                                                                         # Do not print semicolons, except at the beginning of lines which may need them.
	--single-attribute-per-line                                                                       # Enforce single attribute per line in HTML, Vue and JSX. Defaults to false.
	--single-quote                                                                                    # Use single quotes instead of double quotes. Defaults to false.
	--tab-width: int                                                                                  # Number of spaces per indentation level. Defaults to 2.
	--trailing-comma: string@"nu-complete trail-comma completions"                                    # Print trailing commas wherever possible when multi-line. Defaults to all.
	--use-tabs                                                                                        # Indent with tabs instead of spaces. Defaults to false.
	--vue-indent-script-and-style                                                                     # Indent script and style tags in Vue files. Defaults to false.
	--config: path                                                                                    # Path to a configuration file (.prettierrc, package.json, prettier.config.js).
	--no-config                                                                                       # Do not look for a configuration file.
	--config-precedence: string@"nu-complete config-precedence completions"                           # Define in which order config files and CLI options should be evaluated. Defaults to cli-override.
	--no-editorconfig                                                                                 # Don't take .editorconfig into account when parsing configuration.
	--find-config-path: path                                                                          # Find and print the path to a configuration file for the given input file.
	--ignore-path: path                                                                               # Path to a file with patterns describing files to ignore. Multiple values are accepted. Defaults to [.gitignore, .prettierignore].
	--plugin: path                                                                                    # Add a plugin. Multiple plugins can be passed as separate `--plugin`s. Defaults to [].
	--with-node-modules                                                                               # Process files inside 'node_modules' directory.
	--cursor-offset: int                                                                              # Print (to stderr) where a cursor at the given position would move to after formatting. Defaults to -1.
	--range-end: int                                                                                  # Format code ending at a given character offset (exclusive). The range will extend forwards to the end of the selected statement. Defaults to Infinity.
	--range-start: int                                                                                # Format code starting at a given character offset. The range will extend backwards to the start of the first line containing the selected statement. Defaults to 0.
	--cache                                                                                           # Only format changed files. Cannot use with --stdin-filepath. Defaults to false.
	--cache-location: path                                                                            # Path to the cache file.
	--cache-strategy: string@"nu-complete cache-strategy completions"                                 # Strategy for the cache to use for detecting changed files.
	--no-color                                                                                        # Do not colorize error messages.
	--no-error-on-unmatched-pattern                                                                   # Prevent errors when pattern is unmatched.
	--file-info: path                                                                                 # Extract the following info (as JSON) for a given file path.
	--help(-h)                                                                                        # Show CLI usage, or details about the given flag. Example: --help write
	--ignore-unknown(-u)                                                                              # Ignore unknown files.
	--insert-pragma                                                                                   # Insert @format pragma into file's first docblock comment. Defaults to false.
	--log-level: string@"nu-complete log-level completions"                                           # What level of logs to report. Defaults to log.
	--require-pragma                                                                                  # Require either '@prettier' or '@format' to be present in the file's first docblock comment in order for it to be formatted. Defaults to false.
	--stdin-filepath: path                                                                            # Path to the file to pretend that stdin comes from.
	--support-info                                                                                    # Print support information as JSON.
	--version(-v)                                                                                     # Print version.
]
