# written by graefchen

def langs [] {
	let lang_list = {
		Ada: [alr]
		AWK: [awk gawk goawk]
		AutoHotkey: [Ahk2Exe AutoHotkey32 AutoHotkey64]
		Bash: [bash]
		BASIC: [sbasic]
		C: [clang msvc gcc tcc]
		"C++": [clang gcc]
		"Common Lisp": [sbcl]
		D: [dmd]
		djot: [djot jotdown godjot]
		Elm: [elm]
		elvish: [elvish]
		erde: [erde]
		factor: [factor]
		fennel: [fennel]
		go: [go]
		Haskell: [ghc ghci]
		hy: [hy]
		io: [io]
		J: [jconsole j]
		Janet: [janet]
		Java: [javac]
		JavaScript: [deno node]
		jq: [jq jqp]
		Julia: [julia]
		k: [k]
		klongpy: [kgpy]
		LaTeX: [latex]
		Lua: [lua luajit]
		Markdown: [markdown]
		numbat: [numbat]
		nushell: [nu]
		Odin: [odin]
		Papyrus: [PapyrusCompiler]
		Perl: [perl]
		Picat: [picat]
		Powershell: [powershell]
		Prolog: [scryer-prolog tpl]
		purescript: [purescript spago]
		Python: [python pypy]
		R: [R]
		Ruby: [ruby]
		Rust: [cargo rustc]
		rye: [rye]
		SASS: [sass]
		Shell: [sh]
		SNOBOL4: [snobol4]
		sqlite: [sqlite3]
		TypeScript: [deno]
		v: [v]
		wren: [wren wrenc]
		zig: [zig]
	}

	let keys = ($lang_list | transpose key value | get key)

	let exec = ($env.Path
		# | where { |x| ($x | str contains "WINDOWS") : false }
		| each { |x|
			do --ignore-errors {
				ls -lam $x
				| where { $in.type == "application/octet-stream" or $in.type == "symlink" or $in.type == "unknown" }
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