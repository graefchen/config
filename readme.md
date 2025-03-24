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

### completions

- extern -- extern ressources that I inport from [nushell/nu_scripts](https://github.com/nushell/nu_scripts)
  - [bat](https://github.com/sharkdp/bat) -- a cat alternative
  - [cargo](https://www.rust-lang.org) -- the rust language
  - [curl](https://curl.se) -- a fetch tool
  - [gh](https://cli.github.com) -- the github cli
  - [git](https://git-scm.com) -- the git version controll system
  - [npm](https://nodejs.org/en) -- the package manager of node
  - [rg](https://github.com/BurntSushi/ripgrep) -- a grep alternative
  - [rustup](https://www.rust-lang.org) -- the rust init tool
  - [vs-code](https://code.visualstudio.com) -- vscode
  - [yarn](https://yarnpkg.com) -- the yarn package manager
- lang -- all programmming languages I use
  - [cake](https://github.com/thradams/cake) -- a c23 frontend
  - [dart](https://dart.dev) -- the dart language
  - [deno](https://deno.com) -- the deno js runtime
  - [dotnet](https://dotnet.microsoft.com/en-us/) -- the dotnet framework
  - [elm](https://elm-lang.org) -- the elm language
  - [erde](https://github.com/erde-lang/erde) -- the erde language
  - [fennel](https://github.com/bakpakin/Fennel) -- the fennel language
  - [go](https://go.dev) -- the go language
  - [jq](https://jqlang.org) -- the jq language
  - [julia](https://julialang.org) -- the julia language
  - [lua](https://www.lua.org) -- the lua language
  - [numbat](https://numbat.dev) -- the numbat language
  - [odin](https://odin-lang.org) -- the odin language
  - [picat](https://picat-lang.org) -- the picat language
  - [purs](https://www.purescript.org) -- the purescript language
  - [python](https://www.python.org) -- the pyton language
  - [sass](https://sass-lang.com) -- the sass language
- package -- all package managers I use
  - [luarocks](https://luarocks.org) -- the lua package manager
  - [pip](https://pypi.org/project/pip/) -- the python package manager
  - [spago](https://github.com/purescript/spago) -- the purescript package manager
- tools -- all tools I use
  - [cmake](https://cmake.org) -- a c build system
  - [fd](https://github.com/sharkdp/fd) -- a find alternative
  - [foto](https://github.com/waynezhang/foto) -- a photo publishing tool
  - [glow](https://github.com/charmbracelet/glow) -- a markdown renderer
  - [gum](https://github.com/charmbracelet/gum) -- a tool for glamorous scripts
  - [hexyl](https://github.com/sharkdp/hexyl) -- a hex viewer
  - [hyperfine](https://github.com/sharkdp/hyperfine) -- a benchmarking tool
  - [lsd](https://github.com/lsd-rs/lsd) -- a next gen ls command
  - [meson](https://mesonbuild.com) -- a c build system
  - [moul](https://github.com/moul-co/moul) -- a minimal photo publishing tool
  - [nap](https://github.com/maaslalani/nap) -- a code snippet tool
  - [ninja](https://ninja-build.org) -- a build system
  - [onefetch](https://github.com/o2sh/onefetch) -- a git info tool
  - [pastel](https://github.com/sharkdp/pastel) -- a tool to for colour
  - [rgp-cli](https://github.com/facundoolano/rpg-cli) -- a small cli game
  - [scc](https://github.com/boyter/scc) -- a line of code counter
  - [serve](https://github.com/vercel/serve) -- a static file server
  - [ssh](https://www.openssh.com) -- a secure shell
  - [starship](https://starship.rs) -- a cross shell prompt
  - [tig](https://github.com/jonas/tig) -- a text-mode interface for git
  - [tokei](https://github.com/XAMPPRocky/tokei) -- a line of code counter
  - [zeit](https://github.com/mrusme/zeit) -- a time tracker
  - [zola](https://www.getzola.org) -- a static site engine
- misc -- all my miscellaneous small completions for small command line apps

### scripts

- b -- move/rename many files
- commit -- like commitzen
- executables -- see all executables in the path
- goapps -- see all go apps
- rand -- a small script that returns a string out of a list of strings
- rustapps -- see all rust apps
- setup -- setting up command line apps and more stuff I like
- walk -- a bookmarking script

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
  - goyo [ref](https://github.com/junegunn/goyo.vim)
  - rainbow csv [ref](https://github.com/mechatroner/rainbow_csv)
  - rainbow parenthesis [ref](https://github.com/junegunn/rainbow_parentheses.vim)
  - vim you autocorrect [ref](https://github.com/sedm0784/vim-you-autocorrect)
  - writegooder [ref](https://github.com/JKirchartz/writegooder.vim)
