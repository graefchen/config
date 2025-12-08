# based on: Io 20110905
# link: https://iolanguage.org

def "nu-complete io" [] { ls -lat | where name =~ ".io" | get name }

# Io programmming language
export extern "io" [
	file?: string@"nu-complete io"
	--version   # print the version of the interpreter and exit
	-h          # print this help message and exit
	-e: string  # eval a given expression and exit
	-i: string  # run the interpreter, after processing the files passed
]
