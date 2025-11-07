# Written by graefchen
# Just some miscellaneous apps (small and big)
# Or just as text for the command

# based on: jqp version 0.7.0
# link: https://github.com/noahgorstein/jqp

def "nu-complete json" [] {
	ls -lat | where name =~ "**/*.json"
}

# jqp is a TUI to explore the jq command line utility
export extern "jqp" [
	--config: string       # path to config file (default is $HOME/.jqp.yaml)
	--file(-f): string@"nu-complete json"     # path to the input JSON file
	--help(-h)             # help for jqp
	--theme(-t): string    # jqp theme
	--version(-v)          # version for jqp
]

# based on: Io 20110905
# link: https://iolanguage.org

def "nu-complete io" [] {
	ls -lat | where name =~ ".io"
}

# Io programmming language
export extern "io" [
	file?: string@"nu-complete io"
]

# based on wren_cli 0.4.0
# link: https://github.com/wren-lang/wren-cli

def "nu-complete wren" [] {
	ls -lat | where name =~ ".wren"
}

# the wren cli
export extern wren [
	file?: string@"nu-complete wren"
	--help    # Show command line usage
	--version # Show version
]

export extern wrenc [
	file?: string@"nu-complete wren"
	--help(-h)    # print wrenc command line options
	--version(-v) # print wrenc and Wren version
	-e: string    #  evaluate code
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
def "nu-complete fi" [] { ls -lat | where name =~ ".fos" }
# fallout 4 save inspector
export extern "fi" [] { ...file:string@"nu-complete fi" }
alias fa = fi ...(ls -lat | where name =~ ".fos" | get name | sort -in)
# skyrim save
def "nu-complete si" [] { ls -lat | where name =~ ".ess" }
# skyrim save inspector
export extern "si" [] { ...file:string@"nu-complete si" }
alias sa = si ...(ls -lat | where name =~ ".ess" | get name | sort -in)

# Commented out (outdated|unwanted) misc items
