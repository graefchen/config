# Written by graefchen
# based on: tokei 12.1.2
# link: https://github.com/XAMPPRocky/tokei

def "nu-complete tokei format" [] {
	["commas" "dots" "plain" "underscore"]
}

def "nu-complete tokei output" [] {
	["cbor" "json" "yaml"]
}

def "nu-complete tokei sort" [] {
	["files" "lines" "blanks" "code" "comments"]
}

# Count your code, quickly.
export extern "tokei" [
	...input: string
	--compact (-C)                                       # Do not print statistics about embedded languages.
	--files (-f)                                         # Will print out statistics on individual files
	--help (-h)                                          # Prints help information
	--hidden                                             # Count hidden files.
	--languages (-l)                                     # Prints out supported languages and their extensions.
	--no-ignore                                          # Don't respect ignore files (.gitignore, .ignore, etc.).
	--no-ignore-dot                                      # Don't respect .ignore and .tokeignore files, including those in parent directories.
	--no-ignore-parent                                   # Don't respect ignore files (.gitignore, .ignore, etc.) in parent directories.
	--no-ignore-vcs                                      # Don't respect VCS ignore files (.gitignore, .hgignore, etc.), including those in parent directories.
	--version (-V)                                       # Prints version information
	--verbose (-v)                                       # Set log output level.
	--columns (-c): number                               # Sets a strict column width of the output, only available for terminal output.
	--exclude (-e): string                               # Ignore all files & directories matching the pattern.
	--input (-i): string                                 # Gives statistics from a previous tokei run. Can be given a file path, or "stdin" to read from stdin.
	--num-format (-n): string@"nu-complete tokei format" # Format of printed numbers.
	--output (-o): string@"nu-complete tokei output"     # Outputs Tokei in a specific format. Compile with additional features for more format support.
	--sort (-s): string@"nu-complete tokei sort"         # Sort languages based on column.
	--type (-t): string                                  # Filters output by language type, seperated by a comma. i.e. -t=Rust,Markdown
]