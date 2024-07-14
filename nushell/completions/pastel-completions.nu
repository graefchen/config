# Written by greafchen
# based on: pastel 0.9.0
# link: https://github.com/sharkdp/pastel


# Display information about the given color
export extern "pastel color" [

]

# Show a list of available color names
export extern "pastel list" [

]

# Generate a list of random colors
export extern "pastel random" [

]

# Generate a set of visually distinct colors
export extern "pastel distinct" [

]

# Sort colors by the given property
export extern "pastel sort-by" [

]

# Interactively pick a color from the screen (pipette)
export extern "pastel pick" [

]

# Convert a color to the given format
export extern "pastel format" [

]

# Print colored text using ANSI escape sequences
export extern "pastel paint" [

]

# Generate an interpolating sequence of colors
export extern "pastel gradient" [

]

# Mix two colors in the given colorspace
export extern "pastel mix" [

]

# Simulate a color under a certain colorblindness profile
export extern "pastel colorblind" [

]

# Set a color property to a specific value
export extern "pastel set" [

]

# Increase color saturation by a specified amount
export extern "pastel saturate" [

]

# Decrease color saturation by a specified amount
export extern "pastel desaturate" [

]

# Lighten color by a specified amount
export extern "pastel lighten" [

]

# Darken color by a specified amount
export extern "pastel darken" [

]

# Rotate the hue channel by the specified angle
export extern "pastel rotate" [

]

# Get the complementary color (hue rotated by 180°)
export extern "pastel complement" [

]

# Create a gray tone from a given lightness
export extern "pastel gray" [

]

# Completely desaturate a color (preserving luminance)
export extern "pastel to-gray" [

]

# Get a readable text color for the given background color
export extern "pastel textcolor" [

]

# Print the help of the given subcommand(s)
export extern "pastel help" []

def "nu-completion pastel color-mode" [] {
	["24bit" "8bit" "off" "auto"]
}

def "nu-completion pastel color-picker" [] {
	["gpick" "xcolor" "wcolor" "grabc" "colorpicker" "chameleon" "kcolorchooser" "zenity" "yad"]
}

# A command-line tool to generate, analyze, convert and manipulate colors
export extern "pastel" [
	--color-mode(-m): string@"nu-completion pastel color-mode" # Specify the terminal color mode.
	--force-color(-f)                                          # Alias for --mode=24bit
	--color-picker: string@"nu-completion pastel color-picker" # Use a specific tool to pick the colors-
	-h, --help(-h)                                             # Print help information
	--version(-V)                                              # Print version information
]