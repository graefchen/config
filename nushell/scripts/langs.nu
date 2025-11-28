# written by graefchen
# NOTE: Just looks for the binary files ... not 100% accurate.

# Which languages do I have installed?
export def main [] {
	let lang_list = {
		Ada: [alr]
		AutoHotkey: [Ahk2Exe AutoHotkey32 AutoHotkey64]
		AWK: [awk goawk]
		Bash : [bash]
		BASIC: [sbasic TinyBasic]
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
		J: [jqt]
		Janet: [janet]
		Java: [javac]
		JavaScript : [bun deno node]
		jq: [jq jqp]
		Julia: [julia]
		k : [k]
		LaTeX : [latex]
		Lua : [lua luajit]
		Nim: [nim]
		Numbat : [numbat]
		Nushell : [nu]
		Odin : [odin]
		Papyrus: [PapyrusCompiler]
		Perl: [perl]
		PHP: [php]
		PureScript: [purs spago]
		Python : [python]
		R: [R]
		Reku: [raku]
		Ruby: [ruby]
		Rust : [cargo rustc]
		SASS : [sass]
		SNOBOL4 : [snobol4]
		sqlite : [sqlite3]
		TypeScript : [bun deno]
		uxn: [raven-cli raven-gui]
		V: [v]
		wren : [wren wrenc]
		zig: [zig]
	}

	let keys = ($lang_list | transpose key value | get key)

	let exec = ($env.Path
		| each { |x| do --ignore-errors { ls $x | get name | each { $in | path parse | get stem } | uniq } }
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