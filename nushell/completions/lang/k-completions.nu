# based on: kona-211225
# link: https://github.com/kevinlawler/kona

def "nu-complete k" [] { ls -lat | where name =~ ".k" | get name }

# kona(k3) programming language
export extern "k" [
	-h: int       # open an HTTP port
	-i: int       # open an IPC port
	-e: string    # execute a string
	-x: string    # execute a string and print
	file?: string@"nu-complete k" # execute a script
]