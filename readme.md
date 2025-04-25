# config

Just my config files.

## table of contents

- [table of contents](#table%20of%20contents)
- [What it includes](#what%20it%20includes)
- [nushell](#nushell)
  - [completions](#completions)
  - [scripts](#scripts)
- [vim](#vim)

## What it includes

- starship prompt configs
- (neo)vim config
- vscode extensions i use
- bash/nushell config
- some [nap](https://github.com/maaslalani/nap) stuff

## nushell

[nushell](https://www.nushell.sh) is the main shell that I use for interacting with my computer.
I like this shell for multiple good reasons.

### completions

- extern &mdash; extern ressources that I inport from [nushell/nu_scripts](https://github.com/nushell/nu_scripts)
  - [bat](https://github.com/sharkdp/bat) &mdash; a cat alternative
  - [cargo](https://www.rust-lang.org) &mdash; the rust language
  - [curl](https://curl.se) &mdash; a fetch tool
  - [gh](https://cli.github.com) &mdash; the github cli
  - [git](https://git-scm.com) &mdash; the git version controll system
  - [npm](https://nodejs.org/en) &mdash; the package manager of node
  - [rg](https://github.com/BurntSushi/ripgrep) &mdash; a grep alternative
  - [rustup](https://www.rust-lang.org) &mdash; the rust init tool
  - [vs-code](https://code.visualstudio.com) &mdash; vscode
  - [yarn](https://yarnpkg.com) &mdash; the yarn package manager
- lang &mdash; all programmming languages I use
  - [cake](https://github.com/thradams/cake) &mdash; a c23 frontend
  - [dart](https://dart.dev) &mdash; the dart language
  - [deno](https://deno.com) &mdash; the deno js runtime
  - [dotnet](https://dotnet.microsoft.com/en-us/) &mdash; the dotnet framework
  - [elm](https://elm-lang.org) &mdash; the elm language
  - [erde](https://github.com/erde-lang/erde) &mdash; the erde language
  - [fennel](https://github.com/bakpakin/Fennel) &mdash; the fennel language
  - [go](https://go.dev) &mdash; the go language
  - [jq](https://jqlang.org) &mdash; the jq language
  - [julia](https://julialang.org) &mdash; the julia language
  - [lua](https://www.lua.org) &mdash; the lua language
  - [numbat](https://numbat.dev) &mdash; the numbat language
  - [odin](https://odin-lang.org) &mdash; the odin language
  - [picat](https://picat-lang.org) &mdash; the picat language
  - [purs](https://www.purescript.org) &mdash; the purescript language
  - [python](https://www.python.org) &mdash; the pyton language
  - [sass](https://sass-lang.com) &mdash; the sass language
- package &mdash; all package managers I use
  - [luarocks](https://luarocks.org) &mdash; the lua package manager
  - [pip](https://pypi.org/project/pip/) &mdash; the python package manager
  - [spago](https://github.com/purescript/spago) &mdash; the purescript package manager
- tools &mdash; all tools I use
  - [cmake](https://cmake.org) &mdash; a c build system
  - [djot](https://djot.net) &mdash; the djot light markup language
  - [fd](https://github.com/sharkdp/fd) &mdash; a find alternative
  - [foto](https://github.com/waynezhang/foto) &mdash; a photo publishing tool
  - [glow](https://github.com/charmbracelet/glow) &mdash; a markdown renderer
  - [gum](https://github.com/charmbracelet/gum) &mdash; a tool for glamorous scripts
  - [hexyl](https://github.com/sharkdp/hexyl) &mdash; a hex viewer
  - [hyperfine](https://github.com/sharkdp/hyperfine) &mdash; a benchmarking tool
  - [lsd](https://github.com/lsd-rs/lsd) &mdash; a next gen ls command
  - [meson](https://mesonbuild.com) &mdash; a c build system
  - [moul](https://github.com/moul-co/moul) &mdash; a minimal photo publishing tool
  - [nap](https://github.com/maaslalani/nap) &mdash; a code snippet tool
  - [ninja](https://ninja-build.org) &mdash; a build system
  - [onefetch](https://github.com/o2sh/onefetch) &mdash; a git info tool
  - [pastel](https://github.com/sharkdp/pastel) &mdash; a tool to for colour
  - [rgp-cli](https://github.com/facundoolano/rpg-cli) &mdash; a small cli game
  - [scc](https://github.com/boyter/scc) &mdash; a line of code counter
  - [serve](https://github.com/vercel/serve) &mdash; a static file server
  - [ssh](https://www.openssh.com) &mdash; a secure shell
  - [starship](https://starship.rs) &mdash; a cross shell prompt
  - [tig](https://github.com/jonas/tig) &mdash; a text-mode interface for git
  - [tokei](https://github.com/XAMPPRocky/tokei) &mdash; a line of code counter
  - [webp](https://developers.google.com/speed/webp) &mdash; the webp image compression
  - [zeit](https://github.com/mrusme/zeit) &mdash; a time tracker
  - [zola](https://www.getzola.org) &mdash; a static site engine
- misc &mdash; all my miscellaneous small completions for small command line apps

### scripts

- b &mdash; move/rename many files
- commit &mdash; like commitzen
- executables &mdash; see all executables in the path
- goapps &mdash; see all go apps
- rand &mdash; a small script that returns a string out of a list of strings
- rustapps &mdash; see all rust apps
- setup &mdash; setting up command line apps and more stuff I like
- toc &mdash; creates a table of contents from a markdown file
- vdf &mdash; parse the Valve Data Format
- walk &mdash; a bookmarking script

## vim

- color:
  - atlas [ref](https://github.com/huyvohcmc/atlas.vim)
  - ayu [ref](https://github.com/ayu-theme/ayu-vim)
  - hemisu [ref](https://github.com/noahfrederick/vim-hemisu)
  - jcs [ref](https://github.com/jcs/dotfiles/blob/master/.vim/colors/jcs.vim)
  - monochrome [ref](https://github.com/fxn/vim-monochrome)
  - off [ref](https://github.com/pbrisbin/vim-colors-off)
  - paramount [ref](https://github.com/owickstrom/vim-colors-paramount)
  - pencil [ref](https://github.com/preservim/vim-colors-pencil)
  - preto [ref](https://github.com/ewilazarus/preto)
  - pushcx [ref](https://gist.github.com/pushcx/8f9fe335f7812a31b51d552b268e2cbc)
  - sunbather [ref](https://github.com/nikolvs/vim-sunbather)
- plugins:
  - djot [ref](https://github.com/jgm/djot)
  - goyo [ref](https://github.com/junegunn/goyo.vim)
  - rainbow csv [ref](https://github.com/mechatroner/rainbow_csv)
  - rainbow parentheses [ref](https://github.com/junegunn/rainbow_parentheses.vim)
  - vim you autocorrect [ref](https://github.com/sedm0784/vim-you-autocorrect)
  - writegooder [ref](https://github.com/JKirchartz/writegooder.vim)
