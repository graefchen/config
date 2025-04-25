# Walk nushell script
# written by graefchen

# Function to get the bookmarks
def get_bookmarks []: nothing -> string {
	$env.WALK_PATH?
	| default (($nu.home-path? | path join ".local" "share" "walk"))
	| if (not ($in | path exists)) { mkdir $in; $in } else { $in }
	| path join "bookmarks.nuon"
}

# Function to save the bookmarks
def save_bookmarks []: any -> nothing {
	$in | save -f (get_bookmarks)
}

# creating a bookmark list for custom completion
def bookmarks []: nothing -> nothing {
	walk list
	| each {|r| { value: $r.name, description: $r.path }}
}

# List all bookmarks
export def "walk list" []: nothing -> any, nothing -> table {
	let pth = (get_bookmarks)
	if (not ($pth | path exists)) {
		[] | save $pth
	}
	open ($pth) | sort -v
}

# Creating an new bookmark
export def --env "walk add" [
	name?: string # The name of the new bookmark
	path?: path # The path of the new bookmark
]: nothing -> nothing {
	mut name = $name
	mut path = $path
	if ($name | is-empty) {
		$name = ($env.PWD | split row "\\" | last)
	}
	if ($path | is-empty) {
		$path = ($env.PWD)
	}

	if (walk list | get name | where {|x| $x == $name} | is-empty) {
		if (($path | path type) == "dir") and ($path | path exists) {
			list
			| append {name: ($name), path: ($path) }
			| save_bookmarks
		}
	} else {
		print $"The bookmark: \"(ansi yellow)($name)(ansi reset)\" already exists."
	}
}

# Deleting an bookmark
export def "walk remove" [
	name: string@bookmarks # The bookmarks to delete
]: nothing -> nothing {
	list
	| where {|r| not ($r.name == $name) }
	| save_bookmarks
}

# Renames a bookmark
export def "walk rename" [
	old_name: string@bookmarks # The bookmark to rename
	new_name: string # The new name for the bookmark
]: nothing -> nothing {
	if (walk list | is-empty) {
		print "You can not change a name, because there are no bookmarks."
	} else {
		if (walk list | get name | where {|x| $x == $new_name} | is-empty) {
			list
			| update cells -c ["name"] {|v|if $v == $old_name {$new_name} else {$v}}
			| save_bookmarks
		} else {
			print $"The bookmark: \"(ansi yellow)($new_name)(ansi reset)\" already exists."
		}
	}
}

# Reset all bookmarks
export def "walk reset" []: nothing -> nothing {
	(rm -f (get_bookmarks))
}

# A simple and opinionated bookmark-like module to get around your system fast.
export def --env walk [
	name: string@bookmarks
]: nothing -> nothing {
	if ($name | is-not-empty) {
		let list = (walk list)
		if ($name in $list) {
			$list
			| where {|r| $r.name == $name}
			| get path
			| get 0
			| cd $in
		} else {
			print $"The bookmark: \"(ansi yellow)($name)(ansi reset)\" does not exists."
		}
	} else {
		help walk
	}
}
