# config

Just my config files.

## table of contents

- [table of contents](#table-of-contents)
- [What it includes](#what-it-includes)
- [nushell](#nushell)
  - [completions](#completions)
  - [scripts](#scripts)
- [vim](#vim)
- [data](#data)
  - [anno1404](#anno1404)
    - [military_camps](#military_camps)
    - [ships](#ships)
  - [bosses](#bosses)
  - [ds3](#ds3)
    - [bosses](#bosses)
    - [classes](#classes)
    - [data table](#data-table)
- [content](#content)
  - [haiku](#haiku)
- [footnotes](#footnotes)

## What it includes

- starship prompt configs
- (neo)vim config
- vscode extensions I use
- bash/nushell config
- some [nap](https://github.com/maaslalani/nap) stuff

## nushell

[nushell](https://www.nushell.sh) is the main shell that I use for interacting with my computer.
I like this shell for multiple good reasons.

### completions

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
  - [pastel](https://github.com/sharkdp/pastel) &mdash; a tool for colour information
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

- b &mdash; move files into the binary folder (fast way for me to add executable to the path)
- commit &mdash; like commitzen, but as a shellscript (with the help og [gum](https://github.com/charmbracelet/gum))
- dead-links &mdash; checking if links in a md document are not dead
- depth &mdash; see the maximum depth of the folder
- executables &mdash; see all executables in the path
- fcount &mdash; count of all the file extensions in you folder
- goapps &mdash; see all go apps
- hira &mdash; transforms romanji to hirigana
- is-url &mdash; check if a string is an url
- monster &mdash; how much is something worth ... in monster energy drinks!!!
- neocitie &mdash; neocities api command
- rand &mdash; a small script that returns a string out of a list of strings
- rustapps &mdash; see all rust apps
- setup &mdash; setting up command line apps and more stuff I like
- spark &mdash; sparkline command
- srcom &mdash; speedrun.com api command (unfinished)
- toc &mdash; creates a table of contents from a markdown file
- walk &mdash; a bookmarking script

## nvim

<!-- TODO: 2025-08-08 Finish-->

## data

A directory with some data that I play with.

> [!note] TSV vs. CSV
> Why?

### anno1404

**Source:**

1. [fandom wiki](https://anno1404.fandom.com/wiki/Anno_1404_Wiki)

#### military_camps

All Statistics about the military camps.

#### ships

All Statistics about the ships.

### bosses

Started with (which is now simple_bosses.csv):

```csv
name,game
Iudex Gundyr,Dark Souls III
High Lord Wolnir,Dark Souls III
Gravelord Nito,Dark Souls
Seath the Scaleless,Dark Souls
"Gwyn, Lord of Cynder",Dark Souls
Old King Allant,Demon Souls
Rom,Bloodborne
Genichiro Ashina,Sekiro
Naaslaarum,The Elder Scrolls V: Skyrim
Voslaarum,The Elder Scrolls V: Skyrim
```

### ds3

#### bosses

A tsv file about stats from the Game Dark Souls 3

> [!note]
> I am trying to use db normalisation to make it quite smaller and try to
> create multiple tables with it (that I can hopefully import into an db)

**Sources:**

1. [wikikdot](http://darksouls3.wikidot.com/bosses)
2. [fextralive](https://darksouls3.wiki.fextralife.com/Bosses)

#### classes

**Sources:**

1. [wikidot](http://darksouls3.wikidot.com/classes)
2. [fextralive](https://darksouls3.wiki.fextralife.com/Classes)

#### data table

A data table about every weapon, shield and spell's.

This data only shows base (+0) versions of the Items.

**Sources:**

1. [wikidot data-table p.1](http://darksouls3.wikidot.com/data-table)
2. [wikidot data-table p.2](http://darksouls3.wikidot.com/data-table/p/2)
3. [wikidot data-table p.3](http://darksouls3.wikidot.com/data-table/p/3)

## content

### logos

all the logos I use:

- black-moon-filled.svg &mdash; a black filled moon
- black-moon-outline.svg &mdash; a black outline of a moon
- white-moon-filled.svg &mdash; a white filled moon
- white-moon-outline.svg &mdash; a white outline of a moon

### haiku

a "database" of _hopefully copyright free_ (english) haiku

## footnotes

_todo_
