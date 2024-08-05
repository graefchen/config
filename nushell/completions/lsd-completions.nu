# Written by graefchen
# based on: lsd 1.1.2
# link: https://github.com/lsd-rs/lsd

def "nu-complete lsd mode" [] {
	[ "always" "auto" "never" ]
}

def "nu-complete lsd icon" [] {
	[ "fancy" "unicode" ]
}

def "nu-complete lsd permission" [] {
	[ "rwx" "octal" "attributes" "disable" ]
}

def "nu-complete lsd size" [] {
	[ "default" "short" "bytes" ]
}

def "nu-complete lsd date" [] {
	[ "date" "locale" "relative" "+date-time-format" ]
}

def "nu-complete lsd sort" [] {
	[ "size" "time" "version" "extension" "git" "none" ]
}

def "nu-complete lsd group" [] {
	[ "none" "first" "last" ]
}

def "nu-complete lsd blocks" [] {
	[ "permission" "user" "group" "context" "size" "date" "name" "inode" "links" "git" ]
}

# An ls command with a lot of pretty colors and some other stuff.
export extern "lsd" [
	--all(-a)                                         # Do not ignore entries starting with
	--almost-all(-A)                                  # Do not list implied . and ..
	--color: string@"nu-complete lsd mode"            # When to use terminal colours [default: auto] [possible values: always, auto, never]
	--icon: string@"nu-complete lsd mode"             # When to print the icons [default: auto] [possible values: always, auto, never]
	--icon-theme: string@"nu-complete lsd icon"       # Whether to use fancy or unicode icons [default: fancy] [possible values: fancy, unicode]
	--classify(-F)                                    # Append indicator (one of */=>@|) at the end of the file names 
	--long(-l)                                        # Display extended file metadata as a table
	--ignore-config                                   # Ignore the configuration file
	--config-file: string                             # Provide a custom lsd configuration file
	--oneline(-1)                                     # Display one entry per line
	--recursive(-R)                                   # Recurse into directories
	--human-readable(-h)                              # For ls compatibility purposes ONLY, currently set by default
	--tree                                            # Recurse into directories and present the result as a tree
	--depth: int                                      # Stop recursing into directories after reaching specified depth
	--directory-only(-d)                              # Display directories themselves, and not their contents (recursively when used with --tree)
	--permission: string@"nu-complete lsd permission" # How to display permissions [default: rwx for linux, attributes for windows] [possible values: rwx, octal, attributes, disable]
	--size: string@"nu-complete lsd size"             # How to display size [default: default] [possible values: default, short, bytes]
	--total-size                                      # Display the total size of directories
	--date: string@"nu-complete lsd date"             # How to display date [default: date] [possible values: date, locale, relative, +date-time-format]
	--timesort(-t)                                    # Sort by time modified
	--sizesort(-S)                                    # Sort by size
	--extensionsort(-X)                               # Sort by file extension
	--gitsort(-G)                                     # Sort by git status
	--versionsort(-v)                                 # Natural sort of (version) numbers within text
	--sort: string@"nu-complete lsd sort"             # Sort by TYPE instead of name [possible values: size, time, version, extension, git, none]
	--no-sort(-u)                                     # Do not sort. List entries in directory order
	--reverse(-r)                                     # Reverse the order of the sort
	--group-dirs: string@"nu-complete lsd group"      # Sort the directories then the files [possible values: none, first, last]
	--group-directories-first                         # Groups the directories at the top before the files. Same as --group-dirs=first
	--blocks: string@"nu-complete lsd blocks"         # Specify the blocks that will be displayed and in what order [possible values: permission, user, group, context, size, date, name, inode, links, git]
	--classic                                         # Enable classic mode (display output similar to ls)
	--no-symlink                                      # Do not display symlink target
	--ignore-glob(-I): string                         # Do not display files/directories with names matching the glob pattern(s). More than one can be specified by repeating the argument
	--inode(-i)                                       # Display the index number of each file
	--git(-g)                                         # Show git status on file and directory" Only when used with --long option
	--dereference(-L)                                 # When showing file information for a symbolic link, show information for the file the link references rather than for the link itself   
	--context(-Z)                                     # Print security context (label) of each file
	--hyperlink: string@"nu-complete lsd mode"        # Attach hyperlink to filenames [default: never] [possible values:always, auto, never]
	--header                                          # Display block headers
	--truncate-owner-after: int                       # Truncate the user and group names if they exceed a certain number of characters
	--truncate-owner-marker: string                   # Truncation marker appended to a truncated user or group name
	--system-protected                                # Includes files with the windows system protection flag set. This is the same as --all on other platforms
	--literal(-N)                                     # Print entry names without quoting
	--help                                            # Print help information
	--version(-V)                                     # Print version
]