# written by graefchen

def list []: nothing -> list<string> {
	cargo install --list
	| split row "\n"
	| split column " "
	| get column1
	| uniq
	| sort
	| reverse
	| drop
	| reverse
}

export def string []: nothing -> string {
	list | str join " "
}

# print all rust apps
export def main []: nothing -> list<string> {
	list
}