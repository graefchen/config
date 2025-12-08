# Written by graefchen
# Just some miscellaneous apps (small and big)
# Or just as text for the command

# based on: bunnyfetch v0.2.0
# link: https://github.com/Rosettea/bunnyfetch

# Tiny system info fetch utility.
export extern "bunnyfetch" [
       --help(-h)              # help for bunnyfetch
       --no-distro-color(-d)   # don't use the color defined in os-release for the OS color
]

# based on sqlite3
# link: https://sqlite.org/download.html

export extern sqlite3 [
	filename
	-A # run ".archive ARGS" and exit
]

# based on https://github.com/XXIIVV/oscean/tree/edc4de3b16908f1c09089b9756630b067eceec09/src/projects/arvelie

# arvelie is a calender format
export extern "arvelie" [
	date?: string # The Arvelie or ISO 8601 Date
]

# fallout 4 save
def "nu-complete fi" [] { ls -lat | where name =~ ".fos" | get name }
# fallout 4 save inspector
export extern "fi" [] { ...file:string@"nu-complete fi" }
alias fa = fi ...(ls -lat | where name =~ ".fos" | get name | sort -in)
# skyrim save
def "nu-complete si" [] { ls -lat | where name =~ ".ess" | get name }
# skyrim save inspector
export extern "si" [] { ...file:string@"nu-complete si" }
alias sa = si ...(ls -lat | where name =~ ".ess" | get name | sort -in)

# get the current season of the japanese calender
export extern tsuyu [
	--english(-e)      # print the english name
	--japanese(-j)     # print the japanese name
	--romanisation(-r) # print the romanisation
	--solar(-s)        # use the solar term
	--microseason(-m)  # use the microseason
	--help(-h)         # the help message
]

def "pyra-backend" [] {
	return [
		{ value: "lua" , description: "Lua" }
		{ value: "love" , description: "LÖVE" }
		{ value: "javascript" , description: "JavaScript" }
		{ value: "ruby" , description: "Ruby" }
		{ value: "graph" , description: "Graphviz" }
	]
}

# pyra - a comfy language
export extern pyra [
	# NOTE: Maybe add a small little way to directly execute the pyra code.
	--help(-h) # prints help
	backend: string@"pyra-backend"
	input: path
]

# Commented out (outdated|unwanted) misc items
