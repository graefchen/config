# Written by graefchen
# based on: gum version v0.14.5
# link: https://github.com/charmbracelet/gum

# TODO: finish

# Choose an option from a list of choices
export extern "gum choose" []

# Ask a user to confirm an action
export extern "gum confirm" []

# Pick a file from a folder
export extern "gum file" []

# Filter items from a list
export extern "gum filter" []

# Format a string using a template
export extern "gum format" []

# Prompt for some input
export extern "gum input" [
	--help(-h)                         # Show context-sensitive help.
	--version(-v)                      # Print the version number
	--placeholder="Type something..."  # Placeholder value ($GUM_INPUT_PLACEHOLDER)
	--prompt="> "                      # Prompt to display ($GUM_INPUT_PROMPT)
	--value=""                         # Initial value (can also be passed via stdin)
	--char-limit=400                   # Maximum value length (0 for no limit)
	--width=0                          # Input width (0 for terminal width) ($GUM_INPUT_WIDTH)
	--password                         # Mask input characters
	--show-help
	--no-show-help                     # Show help keybinds ($GUM_INPUT_SHOW_HELP)
	--header=""                        # Header value ($GUM_INPUT_HEADER)
	--timeout=0s                       # Timeout until input aborts ($GUM_INPUT_TIMEOUT)
	--strip-ansi
	--no-strip-ansi                    # Strip ANSI sequences when reading from STDIN($GUM_INPUT_STRIP_ANSI)
]

# Join text vertically or horizontally
export extern "gum join" []

# Scroll through a file
export extern "gum pager" []

# Display spinner while running a command
export extern "gum spin" []

# Apply coloring, borders, spacing to text
export extern "gum style" []

# Render a table of data
export extern "gum table" []

# Prompt for long-form text
export extern "gum write" [
	--help(-h)                          # Show context-sensitive help.
	--version(-v)                       # Print the version number
	--width=0                           # Text area width (0 for terminal width) ($GUM_WRITE_WIDTH)
	--height=5                          # Text area height ($GUM_WRITE_HEIGHT)
	--header=""                         # Header value ($GUM_WRITE_HEADER)
	--placeholder="Write something..."  # Placeholder value ($GUM_WRITE_PLACEHOLDER)
	--prompt="┃ "                       # Prompt to display ($GUM_WRITE_PROMPT)
	--show-cursor-line                  # Show cursor line ($GUM_WRITE_SHOW_CURSOR_LINE)
	--show-line-numbers                 # Show line numbers ($GUM_WRITE_SHOW_LINE_NUMBERS)
	--value=""                          # Initial value (can be passed via stdin)($GUM_WRITE_VALUE)
	--char-limit=0                      # Maximum value length (0 for no limit)
	--max-lines=0                       # Maximum number of lines (0 for no limit)
	--show-help                         # Show help key binds ($GUM_WRITE_SHOW_HELP)
	--no-show-help                      # Show help key binds ($GUM_WRITE_SHOW_HELP)
	--timeout=0s                        # Timeout until choose returns selected element($GUM_WRITE_TIMEOUT)
	--strip-ansi                        # Strip ANSI sequences when reading from STDIN($GUM_WRITE_STRIP_ANSI)
	--no-strip-ansi                     # Strip ANSI sequences when reading from STDIN($GUM_WRITE_STRIP_ANSI)
]

# Log messages to output
export extern "gum log" []


# A tool for glamorous shell scripts.
export extern "gum" [
	--help(-h)       # Show context-sensitive help.
	--version(-v)    # Print the version number
]