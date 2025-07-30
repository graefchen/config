# programming languages on me 'puter

Command used (using my [executables command](./nushell/scripts/executables.nu)):

```nushell
executables
| flatten
| filter { not ($in =~ "system32") }
| each { $in | path parse | get stem }
| uniq
| sort
```

## Main 'puter

> [!note]
> This list is only composed on the programming languages for which I have an
> extra language etc installed (even through another program like git or certain
> video game engines/editors).
> Ignored are for example: batch, powershell and the msvc compiler.

Current Number: `36`, including non programming languages like markup languages. Way to many?

- Ada &mdash; [alire](https://ada-lang.io)
- AutoHotkey &mdash; [AutoHotkey](https://www.autohotkey.com)
- AWK &mdash; [GoAWK](https://github.com/benhoyt/goawk)
- Bash &mdash; [git](https://git-scm.com)
- C &mdash; [cake](https://github.com/thradams/cake), [clang](https://releases.llvm.org/download.html), [tcc](https://download.savannah.gnu.org/releases/tinycc/)
- C++ &mdash; [clang](https://releases.llvm.org/download.html)
- D &mdash; [D](https://dlang.org)
- Dart &mdash; [Dart](https://dart.dev/get-dart)
- Djot &mdash; [djot.lua](https://github.com/jgm/djot.lua), [jotdown](https://github.com/hellux/jotdown)
- Elm &mdash; [Elm](https://guide.elm-lang.org/install/elm.html)
- Erde &mdash; [Erde](https://github.com/erde-lang/erde/releases)
- Fennel &mdash; [Fennel](https://fennel-lang.org/setup#downloading-fennel)
- Go &mdash; [Go](https://go.dev/dl/)
- io &mdash; [io](https://iolanguage.org/binaries.html)
- J &mdash; [J](https://code.jsoftware.com/wiki/System/Installation)
- Java &mdash; [ADOPTIUM](https://adoptium.net/temurin/releases/)
- JavaScript &mdash; [nodejs](https://nodejs.org/en), [deno](https://deno.com)
- jq &mdash; [jq](https://www.nial-array-language.org/download/)
- Julia &mdash; [Julia](https://julialang.org)
- k &mdash; [kona](https://github.com/kevinlawler/kona)
- LaTeX &mdash; [MiKTeX](https://miktex.org/about)
- Lua &mdash; [Lua](https://www.lua.org/download.html), [LuaJIT](https://luajit.org)
- Nial &mdash; [Nial](https://www.nial-array-language.org)
- Numbat &mdash; [Numbat](https://github.com/sharkdp/numbat)
- Nushell &mdash;[Nushell](https://www.nushell.sh)
- Odin &mdash;[Odin](https://odin-lang.org)
- Papyrus &mdash; Skyrim, Fallout 4, Skyrim Special Edition
- Picat &mdash; [Picat](https://picat-lang.org/download.html)
- PureScript &mdash; [PureScript](https://www.purescript.org)
- Python &mdash; [Python](https://www.python.org)
- R &mdash; [R](https://www.r-project.org)
- Rust &mdash; [Rust](https://www.rust-lang.org)
- rye &mdash; [rye](https://ryelang.org)
- sass &mdash; [Dart Sass](https://github.com/sass/dart-sass/releases/tag/1.89.2)
- SNOBOL4 &mdash; [snobol4](https://ftp.regressive.org/snobol4/)
- SQLite &mdash; [DB4S](https://sqlitebrowser.org), [SQlite](https://sqlite.org/download.html)
- TypeScript &mdash; [deno](https://deno.com)
- Wren &mdash; [wren-cli](https://wren.io)
