# written by graefchen

export def main [] {
	let lang_list = {
		Ada: [alr]
		AWK: [awk]
		AutoHotkey: [Ahk2Exe AutoHotkey32 AutoHotkey64]
		Bash : [bash]
		C : [clang msvc gcc tcc]
		CPP : [clang gcc]
		djot: [djot jotdown]
		Elm : [elm]
		elvish : [elvish]
		erde: [erde]
		fennel : [fennel]
		go : [go]
		Haskell: [ghc ghci]
		io : [io]
		J: [jconsole]
		JavaScript : [deno node]
		k : [k]
		LaTeX : [latex]
		Lua : [lua luajit]
		numbat : [numbat]
		nushell : [nu]
		Odin : [odin]
		Python : [python]
		Rust : [cargo rustc]
		SASS : [sass]
		SNOBOL4 : [snobol4]
		sqlite : [sqlite3]
		TypeScript : [deno]
		wren : [wren wrenc]
		v: [v]
		zig: [zig]
	}

	let keys = ($lang_list | transpose key value | get key)

	let exec = ($env.Path
		# | where { |x| ($x | str contains "WINDOWS") : false }
		| each { |x|
			do --ignore-errors {
				ls $x
				| get name
				| each {
					$in | path parse | get stem
				}
				| uniq
			}
		}
		| flatten
		| uniq
	)

	for $lang in $keys {
		if ($lang_list | get $lang | append $exec | uniq --repeated | is-not-empty) {
			print $"(ansi green)($lang)(ansi reset) has been found."
		} else {
			print $"(ansi red)($lang)(ansi reset) can not be found."
		}
	}
}
