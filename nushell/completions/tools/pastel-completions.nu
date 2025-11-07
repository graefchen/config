# Written by graefchen
# based on: pastel 0.9.0
# link: https://github.com/sharkdp/pastel

def "nu-complete pastel sort-order" [] {
	["brightness" "luminance" "hue" "chroma" "random"]
}

def "nu-complete pastel colorspace" [] {
	[ "Lab" "LCh" "RGB" "HSL"]
}

# Display information about the given color
export extern "pastel color" [
	color?: any # Colors
	--help(-h)  # Print help information
]

# Show a list of available color names
export extern "pastel list" [
	--sort(-s): string@"nu-complete pastel sort-order" # Sort order [default: hue]
	--help(-h)                                         # Print help information
]

def "nu-complete pastel random strategy" [] {
	[
		{ value: "vivid", description: "random hue, limited saturation and lightness values" },
		{ value: "rgb", description: "samples uniformly in RGB space" },
		{ value: "gray", description:" random gray tone (uniform)" },
		{ value: "lch_hue", description: "random hue, fixed lightness and chroma" }
	]
}

# Generate a list of random colors
export extern "pastel random" [
	--strategy(-s): string@"nu-complete pastel random strategy" # Randomization strategy
	--number(-n): number                                        # Number of colors to generate [default: 10]
	--help(-h)                                                  # Print help information
]

# Generate a set of visually distinct colors
export extern "pastel distinct" [
	count?: number       # Number of distinct colors in the set [default: 10]
	colors?: any         # Colors
	--metric(-m): string # Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower.
	--verbose(-v)        # Print simulation output to STDERR
	--help(-h)           # Print help information
]

# Sort colors by the given property
export extern "pastel sort-by" [
	sorder?: string@"nu-complete pastel sort-order" # Sort order
	colors?: any  # Colors
	--reverse(-r) # Reverse the sort order
	--unique(-u)  # Remove duplicate colors (equality is determined via RGB values)
	--help(-h)    # Print help information
]

# Interactively pick a color from the screen (pipette)
export extern "pastel pick" [
	count?: number # Number of colors to pick [default: 1]
	--help(-h)     # Print help information
]

def "nu-complete pastel format type" [] {
	[
		"rgb" "rgb-float" "hex" "hsl" "hsl-hue" "hsl-saturation" "hsl-lightness" "lch" "lch-lightness" "lch-chroma"
		"lch-hue""lab" "lab-a" "lab-b" "luminance" "brightness" "ansi-8bit" "ansi-24bit" "ansi-8bit-escapecode"
		"ansi-24bit-escapecode" "cmyk" "name"
	]
}

# Convert a color to the given format
export extern "pastel format" [
	type?: string@"nu-complete pastel format type" # Output format type.
	--help(-h)                                     # Print help information
]

# Print colored text using ANSI escape sequences
export extern "pastel paint" [
	color?: string   # The foreground color.
	text?: string    #  The text to be printed in color. If no argument is given, the input is read from STDIN.
    --on(-o): string # Use the specified background color
    --bold(-b)       # Print the text in bold face
    --italic(-i)     # Print the text in italic font
    --underline(-u)  # Draw a line below the text
    --no-newline(-n) # Do not print a trailing newline character
    --help(-h)       # Print help information
]

# Generate an interpolating sequence of colors
export extern "pastel gradient" [
	color?: any                                              # Color
	--number(-n): number                                     # Number of colors to generate [default: 10]
	--colorspace(-c): string@"nu-complete pastel colorspace" # The colorspace in which to interpolate [default: Lab]
	--help(-h)                                               # Print help information
]

# Mix two colors in the given colorspace
export extern "pastel mix" [
	color?: any                                              # Color
	colors?: any                                             # Colors
	--colorspace(-c): string@"nu-complete pastel colorspace" # The colorspace in which to interpolate [default: Lab]
	--fraction(-f): number                                   # The number between 0.0 and 1.0 determining how much to mix in from the base color. [default: 0.5]
	--help(-h)                                               # Print help information
]

def "nu-complete pastel colorblind type" [] {
	[ "prot" "deuter" "trit" ]
}

# Simulate a color under a certain colorblindness profile
export extern "pastel colorblind" [
	type?: string@"nu-complete pastel colorblind type" # The type of colorblindness that should be simulated (protanopia, deuteranopia, tritanopia)
	color?: any                                        # Colors
	--help(-h)                                         # Print help information
]

def "nu-complete pastel set property" [] {
	["lightness" "hue" "chroma" "lab-a" "lab-b" "red" "green" "blue" "hsl-hue" "hsl-saturation" "hsl-lightness" ]
}


# Set a color property to a specific value
export extern "pastel set" [
	property?: string@"nu-complete pastel set property" # The property that should be change
	value?: any                                         # The new numerical value of the property
	color?: any                                         # Colors
	--help(-h)                                          # Print help information
]

# Increase color saturation by a specified amount
export extern "pastel saturate" [
	amount?: number # Amount of saturation to add (number between 0.0 and 1.0)
	color?: any     # Colors
	--help(-h)      # Print help information
]

# Decrease color saturation by a specified amount
export extern "pastel desaturate" [
	amount?: number # Amount of saturation to subtract (number between 0.0 and 1.0)
	color?: any     # Colors
	--help(-h)      # Print help information
]

# Lighten color by a specified amount
export extern "pastel lighten" [
	amount?: number # Amount of lightness to add (number between 0.0 and 1.0)
	color?: any     # Colors
	--help(-h)      # Print help information
]

# Darken color by a specified amount
export extern "pastel darken" [
	amount?: number # Amount of lightness to subtract (number between 0.0 and 1.0)
	color?: any     # Colors
	--help(-h)      # Print help information
]

# Rotate the hue channel by the specified angle
export extern "pastel rotate" [
	degree?: number # angle by which to rotate (in degrees, can be negative)
	color?: any     # Colors
	--help(-h)      # Print help information
]

# Get the complementary color (hue rotated by 180°)
export extern "pastel complement" [
	color?: any # Colors
	--help(-h)  # Print help information
]

# Create a gray tone from a given lightness
export extern "pastel gray" [
	lightness?: number # Lightness of the created gray tone (number between 0.0 and 1.0)
	--help(-h)         # Print help information
]

# Completely desaturate a color (preserving luminance)
export extern "pastel to-gray" [
	color?: any # Colors
	--help(-h)  # Print help information
]

# Get a readable text color for the given background color
export extern "pastel textcolor" [
	color?: any # Colors
	--help(-h)  # Print help information
]

def "nu-complete pastel help" [] {
	[
		{ value: "color", description: "Display information about the given color" },
		{ value: "list", description: "Show a list of available color names" },
		{ value: "random", description: "Generate a list of random colors" },
		{ value: "distinct", description: "Generate a set of visually distinct colors" },
		{ value: "sort-by", description: "Sort colors by the given property" },
		{ value: "pick", description: "Interactively pick a color from the screen (pipette)" },
		{ value: "format", description: "Convert a color to the given format" },
		{ value: "paint", description: "Print colored text using ANSI escape sequences" },
		{ value: "gradient", description: "Generate an interpolating sequence of colors" },
		{ value: "mix", description: "Mix two colors in the given colorspace" },
		{ value: "colorblind", description: "Simulate a color under a certain colorblindness profile" },
		{ value: "se", description: "Set a color property to a specific value" },
		{ value: "saturate", description: "Increase color saturation by a specified amount" },
		{ value: "desaturate", description: "Decrease color saturation by a specified amount" },
		{ value: "lighten", description: "Lighten color by a specified amount" },
		{ value: "darken", description: "Darken color by a specified amount" },
		{ value: "rotate", description: "Rotate the hue channel by the specified angle" },
		{ value: "complement", description: "Get the complementary color (hue rotated by 180°)" },
		{ value: "gray", description: "Create a gray tone from a given lightness" },
		{ value: "to-gray", description: "Completely desaturate a color (preserving luminance)" },
		{ value: "textcolor", description: "Get a readable text color for the given background color" },
		{ value: "help", description: "Print this message or the help of the given subcommand(s)" }
	]
}

# Print the help of the given subcommand(s)
export extern "pastel help" [
	...subcommands: string@"nu-complete pastel help" # The subcommand whose help message to display
]

def "nu-complete pastel color-mode" [] {
	["24bit" "8bit" "off" "auto"]
}

def "nu-complete pastel color-picker" [] {
	["gpick" "xcolor" "wcolor" "grabc" "colorpicker" "chameleon" "kcolorchooser" "zenity" "yad"]
}

# A command-line tool to generate, analyze, convert and manipulate colors
export extern "pastel" [
	--color-mode(-m): string@"nu-complete pastel color-mode" # Specify the terminal color mode.
	--force-color(-f)                                          # Alias for --mode=24bit
	--color-picker: string@"nu-complete pastel color-picker" # Use a specific tool to pick the colors-
	-h, --help(-h)                                             # Print help information
	--version(-V)                                              # Print version information
]
