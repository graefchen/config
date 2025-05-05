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

# print all rust apps
def rustapps []: nothing -> list<string> {
	list
}