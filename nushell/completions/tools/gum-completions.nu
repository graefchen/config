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
export extern "gum input" []

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
export extern "gum write" []

# Log messages to output
export extern "gum log" []


# A tool for glamorous shell scripts.
export extern "gum" [
	--help(-h)       # Show context-sensitive help.
	--version(-v)    # Print the version number
]