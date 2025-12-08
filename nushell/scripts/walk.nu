# Walk nushell script
# written by graefchen

# return the name of the bookmark file
def get_bookmarks []: nothing -> string {
	$env.walk_path?
	| default (($nu.home-path? | path join ".config"))
	| path join "bm.msgpackz"
}

# saving the bookmark input
def save_bookmarks []: any -> nothing {
	$in | to msgpackz | save -f (get_bookmarks)
}

# creating a bookmark list for custom completion
def bookmarks [] {
	walk list
	| transpose name path
	| each {|r| { value: $r.name, description: $r.path }}
}

# List all bookmarks
def "walk list" []: nothing -> any, nothing -> table {
	let pth = (get_bookmarks)
	if (not ($pth | path exists)) {
		{} | save $pth
	}
	open ($pth)
	| from msgpackz # we need to add from msgpackz ... because it does not read it natively?
	| sort
}

# Creating an new bookmark
def --env "walk add" [
	name?: string # The name of the new bookmark
	path?: path # The path of the new bookmark
]: nothing -> nothing {
	mut name = $name
	mut path = $path
	if ($name | is-empty) {
		$name = ($env.PWD | path basename)
	}
	if ($path | is-empty) {
		$path = ($env.PWD)
	}
	if ($name in (walk list)) {
		print $"The bookmark: \"(ansi yellow)($name)(ansi reset)\" exists already."
	} else {
		if (($path | path type) == "dir") and ($path | path exists) {
			let p = $path
			walk list
			| insert $name { $p }
			| save_bookmarks
		}
	}
}

# Deleting an bookmark
def "walk remove" [
	name: string@bookmarks # The bookmarks to delete
]: nothing -> nothing {
	if ($name in (walk list)) {
		walk list
		| reject $name
		| save_bookmarks
	} else {
		print $"The bookmark: \"(ansi yellow)($name)(ansi reset)\" can not be deleted, as it does not exist."
	}
}

# A simple and opinionated bookmark-like module to get around your system fast.
def --env "walk" [
	name: string@bookmarks
]: nothing -> nothing {
	if ($name | is-not-empty) {
		let list = walk list
		if ($name in $list) {
			$list
			| get $name
			| cd $in
		} else {
			print $"The bookmark: \"(ansi yellow)($name)(ansi reset)\" does not exists."
		}
	} else {
		help walk
	}
}