# Written by graefchen
# Just some miscellaneous apps (small and big)
# Or just as text for the command

# based on: Io 20110905
# link: https://iolanguage.org

def "nu-complete io" [] { ls -lat | where name =~ ".io" }
# Io programmming language
export extern "io" [ file?: string@"nu-complete io" ]

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
