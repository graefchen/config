# Written by greafchen
# based on: onefetch 2.21.0
# link: https://github.com/sharkdp/pastel

# Command-line Git information tool
export extern "onefetch" [
	input?: path                   # Run as if onefetch was started in <input> instead of the current working directory
	--help(-h)                     # Print help (see a summary with '-h')
	--version(-V)                  # Print version
	--disabled-fields(-d):string   # Allows you to disable FIELD(s) from appearing in the output
	--no-title                     # Hides the title
	--number-of-authors: number    # Maximum NUM of authors to be shown [default: 3]
	--number-of-languages: number  # Maximum NUM of languages to be shown [default: 6]
	--number-of-file-churns:number # Maximum NUM of file churns to be shown [default: 3]
	--churn-pool-size: number      # Minimum NUM of commits from HEAD used to compute the churn summary By default, the actual value is non-deterministic due to time-based computation and will be displayed under the info title "Churn (NUM)"
	--exclude(-e): string          # Ignore all files & directories matching EXCLUDE
	--no-bots                      # Exclude [bot] commits. Use <REGEX> to override the default pattern
	--no-merges                    # Ignores merge commits
	--email(-E)                    # Show the email address of each author
	--http-url                     # Display repository URL as HTTP
	--hide-token                   # Hide token in repository URL
	--include-hidden               # Count hidden files and directories
	--type(-T): string             # Filters output by language type [default: programming markup] [possible values: programming, markup, prose, data]
	--text-colors(-t): string      #  Changes the text colors (X X X...) Goes in order of title, ~, underline, subtitle, colon, and info For example: '--text-colors 9 10 11 12 13 14'
	--iso-time(-z)                 # Use ISO 8601 formatted timestamps
	--number-separator: string     # Which thousands SEPARATOR to use [default: plain] [possible values: plain, comma, space, underscore]
	--no-bold                      # Turns off bold formatting
	--ascii-input: string          # Takes a non-empty STRING as input to replace the ASCII logo It is possible to pass a generated STRING by command substitution For example: '--ascii-input "$(fortune | cowsay -W 25)"'
	--ascii-colors(-c): string     # Colors (X X X...) to print the ascii art
	--ascii-language(-a): string   # Which LANGUAGE's ascii art to print
	--true-color: string           # Specify when to use true color If set to auto: true color will be enabled if supported by the terminal [default: auto] [possible values: auto, never, always]
	---image(-i): path             # Path to the IMAGE file
	--image-protocol: string       # Which image PROTOCOL to use [possible values: kitty, sixel, iterm]
	--color-resolution: number     # VALUE of color resolution to use with SIXEL backend [default: 16] [possible values: 16, 32, 64, 128, 256]
	--no-color-palette             # Hides the color palette
	--no-art                       # Hides the ascii art or image if provided
	--output(-o): string           # Outputs Onefetch in a specific format [possible values: json, yaml]
	--generate:string              # If provided, outputs the completion file for given SHELL [possible values: bash, elvish, fish, powershell, zsh]
	-l, --languages(-l)            # Prints out supported languages
	--package-managers(-p)         # Prints out supported package managers
]