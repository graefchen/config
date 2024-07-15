# written by graefchen

def list []: nothing -> table {
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

export def main []: nothing -> table {
	list
}