# written by graefchen

export def main [] {
	let lang_list = {
		Ada: [alr]
		AWK: [awk]
		AutoHotkey: [Ahk2Exe AutoHotkey32 AutoHotkey64]
		Bash : [bash]
		C : [clang msvc gcc tcc]
		"C++" : [clang gcc]
		"Common Lisp": [sbcl]
		D: [dmd]
		djot: [djot jotdown]
		Elm : [elm]
		elvish : [elvish]
		erde: [erde]
		fennel : [fennel]
		go : [go]
		Haskell: [ghc ghci]
		io : [io]
		J: [jconsole j]
		Janet: [janet]
		Java: [javac]
		JavaScript : [deno node]
		jq: [jq jqp]
		Julia: [julia]
		k : [k]
		LaTeX : [latex]
		Lua : [lua luajit]
		numbat : [numbat]
		nushell : [nu]
		Odin : [odin]
		Perl: [perl]
		Papyrus: [PapyrusCompiler]
		Python : [python]
		R: [R]
		Ruby: [ruby]
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
				| each { $in | path parse | get stem }
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
