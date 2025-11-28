# a passwort manager using age[1], ssh[2] and gum[3]
# inspired by pa[4] and passage[5]
#
# [1]: https://github.com/FiloSottile/age
# [2]: https://www.openssh.org
# [3]: https://github.com/charmbracelet/gum
# [4]: https://github.com/biox/pa
# [5]: https://github.com/FiloSottile/passage
#
# written by graefchen, in under 100 lines of code
#
# depends on:
#   - age
#   - gum
#   - ssh

module pandhelp {
	export def get-identity [] {
		if (($env | get --optional pandora.id) != null) {
			return $env.pandora.id
		} else {
			return $"($env.HOMEPATH)/.ssh/id_ed25519"
		}
	}

	export def get-dir [] {
		return $"($env.HOMEPATH)/.pandora/"
	}

	export def yn [msg: string] {
		let msg = $"($msg) [y/N]: "
		let ans = (gum input --no-show-help --header $msg)
		print $"($msg)($ans)"
		return ($ans =~ "[yY]")
	}
}

use pandhelp

# add a new passwort to pandora
def "pandora add" [name: string]: nothing -> string {
	if ($"(pandhelp get-dir)/($name).age" | path exists) {
		return $"(ansi yellow)($name)(ansi reset) already exists" }

	let pass = (gum input --no-show-help --password --header "enter a password")
	if ($pass | is-empty) { return "password can't be empty" }
	let p2 = (gum input --no-show-help --password --header "enter a password (again)")

	if ($pass != $p2) { return "passwords don't match" }
	touch $"(pandhelp get-dir)/.($name)"

	# Note(2025-11-28): I do not know how secure that is.
	#                   Need to reevaluate it!
	try {
		$pass
		| age --encrypt --recipients-file $"(pandhelp get-identity).pub" -o $"(pandhelp get-dir)/($name).age"
	}

	return $"added (ansi yellow)($name)(ansi reset) to the store"
}

# delete a password from pandora
def "pandora delete" [
	name: string@"pandora list"
]: nothing -> string {
	if (not ($"(pandhelp get-dir)/($name).age" | path exists)) {
		return $"the password (ansi yellow)($name)(ansi reset) doesn't exists" }
	
	if (pandhelp yn $"Do you really want to delete ($name)?") {
		rm $"(pandhelp get-dir)/($name).age"
		return $"deleted (ansi yellow)($name)(ansi reset)"
	}

	return $"did not deleted (ansi yellow)($name)(ansi reset)"
}

# list all passwords from pandora
def "pandora list" []: nothing -> list {
	mut list = (ls (pandhelp get-dir) | get name | path parse | where extension == "age" | get stem )
	return $list
}

# show a password from pandora
def "pandora show" [
	name: string@"pandora list"
]: nothing -> string {
	if (not ($"(pandhelp get-dir)/($name).age" | path exists)) {
		return $"the password (ansi yellow)($name)(ansi reset) doesn't exists" }

	age --decrypt --identity $"(pandhelp get-identity)" $"(pandhelp get-dir)/($name).age"
}

# a passwort manager
#
# pandora is using age[1], ssh[2] and gum[3]
# inspired by pa[4] and passage[5]
#
# [1]: https://github.com/FiloSottile/age
# [2]: https://www.openssh.org
# [3]: https://github.com/charmbracelet/gum
# [4]: https://github.com/biox/pa
# [5]: https://github.com/FiloSottile/passage
def "pandora" []: nothing -> string {
	help pandora
}

hide pandhelp
