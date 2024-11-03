# Written by graefchen
# based on: fd 10.1.0
# link: https://github.com/sharkdp/fd

def "nu-complete fd type" [] {
	[
		{ value: "f", description: "file" },
		{ value: "d", description: "directory" },
		{ value: "dir", description: "directory" },
		{ value: "l", description: "symlink" },
		{ value: "x", description: "executable" },
		{ value: "e", description: "empty" },
		{ value: "s", description: "socket" },
		{ value: "p", description: "pipe" },
		{ value: "c", description: "char-device" },
		{ value: "b", description: "block-device" },
	]
}

def "nu-complete fd when" [] {
	[ "auto" "always" "never" ]
}

# A program to find entries in your filesystem
export extern "fd" [
	--hidden(-H)                                     # Search hidden files and directories
	--no-ignore(-I)                                  # Do not respect .(git|fd)ignore files
	--no-ignore-vcs                                  # Show search results from files and directories that would otherwise be ignored by '.gitignore' files.
	--no-require-git                                 # Do not require a git repository to respect gitignores.
	--no-ignore-parent                               # Show search results from files and directories that would otherwise be ignored by '.gitignore', '.ignore', or '.fdignore' files in parent directories
	--unrestricted(-u)                               # Perform an unrestricted search, including ignored and hidden files.
	--case-sensitive(-s)                             # Case-sensitive search (default: smart case)
	--ignore-case(-i)                                # Case-insensitive search (default: smart case)
	--glob(-g)                                       # Glob-based search (default: regular expression)
	--regex                                          # Perform a regular-expression based search (default).
	--fixed-strings(-F)                              # Treat the pattern as a literal string instead of a regular expression.
	--and                                            # Add additional required search patterns, all of which must be matched.
	--absolute-path(-a)                              # Show absolute instead of relative paths
	--list-details(-l)                               # Use a long listing format with file metadata
	--follow(-L)                                     # Follow symbolic links
	--full-path(-p)                                  # Search full abs. path (default: filename only)
	--print0(-0)                                     # Separate search results by the null character (instead of newlines).
	--max-depth(-d): int                             # Set maximum search depth (default: none)
	--min-depth                                      # Only show search results starting at the given depth.
	--exact-depth                                    # Only show search results at the exact given depth.
	--exclude(-E): string                            # Exclude entries that match the given glob pattern
	--prune                                          # Do not traverse into directories that match the search criteria.
	--type(-t): string@"nu-complete fd type"         # Filter by type.
	--extension(-e): string                          # Filter by file extension
	--size(-S): string                               # Limit results based on the size of files
	--changed-within: string                         # Filter by file modification time (newer than)
	--changed-before: string                         # Filter by file modification time (older than)
	--format: string                                 # Print results according to template
	--exec(-x): string                               # Execute a command for each search result
	--exec-batch(-X): string                         # Execute a command with all search results at once
	--batch-size                                     # Maximum number of arguments to pass to the command
	--color: string@"nu-complete fd when"            # When to use colors [default: auto]
	--threads(-j): int                               # Set number of threads to use for searching & executing
	--max-results                                    # Limit the number of search results to 'count' and quit immediately.
	-1                                               # Limit the search to a single result and quit immediately
	--quiet(-q)                                      # Don't print anything and exit with 0
	--show-errors                                    # Show error for situations such as insufficient permissions or dead symlinks.
	--base-directory: string                         # Change the current working directory of fd to the provided path.
	--path-separator: string                         # Set the path separator to use when printing file paths.
	--search-path: string                            # Provide paths to search as an alternative to the positional <path> argument.
	--strip-cwd-prefix: string@"nu-complete fd when" # By default, relative paths are prefixed with './' when -x/--exec, -X/--exec-batch, or -0/--print0 are given, to reduce the risk of a path starting with '-' being treated as a command line option.
	--one-file-system                                # By default, fd will traverse the file system tree as far as other options dictate.
	--help(-h)                                       # Print help
	--version(-V)                                    # Print version
	pattern?: string                                 # the search pattern (a regular expression, unless '--glob' is used; optional)
	...path: string                                  # the root directories for the filesystem search (optional)
]
