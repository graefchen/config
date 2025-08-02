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

Current Number: `40`, including non programming languages like markup languages. Way to many?

- Ada &mdash; [alire](https://ada-lang.io)
- AutoHotkey &mdash; [AutoHotkey](https://www.autohotkey.com)
- AWK &mdash; [GoAWK](https://github.com/benhoyt/goawk/releases)
- Bash &mdash; [git](https://git-scm.com/downloads)
- C &mdash; [cake](https://github.com/thradams/cake), [clang](https://releases.llvm.org/download.html), [tcc](https://download.savannah.gnu.org/releases/tinycc/)
- C++ &mdash; [clang](https://releases.llvm.org/download.html)
- D &mdash; [D](https://dlang.org/download.html)
- Dart &mdash; [Dart](https://dart.dev/get-dart)
- Djot &mdash; [djot.lua](https://github.com/jgm/djot.lua), [jotdown](https://github.com/hellux/jotdown)
- Elm &mdash; [Elm](https://guide.elm-lang.org/install/elm.html)
- elvish &mdash; [elvish](https://elv.sh/get/)
- Erde &mdash; [Erde](https://github.com/erde-lang/erde/releases)
- Fennel &mdash; [Fennel](https://fennel-lang.org/setup#downloading-fennel)
- Go &mdash; [Go](https://go.dev/dl/)
- io &mdash; [io](https://iolanguage.org/binaries.html)
- J &mdash; [J](https://code.jsoftware.com/wiki/System/Installation)
- Janet &mdash; [Janet](https://janet-lang.org)
- Java &mdash; [ADOPTIUM](https://adoptium.net/temurin/releases/)
- JavaScript &mdash; [nodejs](https://nodejs.org/en/download), [deno](https://deno.com)
- jq &mdash; [jq](https://jqlang.org/download/)
- Julia &mdash; [Julia](https://github.com/janet-lang/janet/releases)
- k &mdash; [kona](https://github.com/kevinlawler/kona)
- LaTeX &mdash; [MiKTeX](https://miktex.org/about)
- Lua &mdash; [Lua](https://www.lua.org/download.html), [LuaJIT](https://luajit.org/download.html)
- Nial &mdash; [Nial](https://www.nial-array-language.org)
- Numbat &mdash; [Numbat](https://github.com/sharkdp/numbat)
- Nushell &mdash;[Nushell](https://www.nushell.sh/book/installation.html)
- Odin &mdash;[Odin](https://odin-lang.org/docs/install/)
- Papyrus &mdash; Skyrim, [Fallout 4](https://store.steampowered.com/app/1946160/Fallout_4_Creation_Kit/), [Skyrim Special Edition](https://store.steampowered.com/app/1946180/Skyrim_Special_Edition_Creation_Kit/)
- Picat &mdash; [Picat](https://picat-lang.org/download.html)
- PureScript &mdash; [PureScript](https://www.purescript.org)
- Python &mdash; [Python](https://www.python.org/downloads/)
- R &mdash; [R](https://cran.r-project.org/mirrors.html)
- Rust &mdash; [Rust](https://www.rust-lang.org/tools/install)
- rye &mdash; [rye](https://github.com/refaktor/rye/releases)
- sass &mdash; [Dart Sass](https://github.com/sass/dart-sass/releases)
- SNOBOL4 &mdash; [snobol4](https://ftp.regressive.org/snobol4/)
- SQLite &mdash; [DB4S](https://sqlitebrowser.org), [SQlite](https://sqlite.org/download.html)
- TypeScript &mdash; [deno](https://deno.com)
- Wren &mdash; [wren-cli](https://github.com/wren-lang/wren-cli/releases), [wren-console](https://github.com/joshgoebel/wren-console/releases)
