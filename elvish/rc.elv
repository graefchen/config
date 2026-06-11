# ~/.elvish/rc.elv

use str
use math
use builtin

# using modules
use github.com/jkbr-19/sindarin-term/date-elv

# using completion
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh

# tutorial on how to use the elvish completion ... thingy:
# https://zzamboni.org/post/using-and-writing-completions-in-elvish/
use github.com/zzamboni/elvish-completions/comp

# using my own monorepo elvish scripts
use github.com/graefchen/monorepo/nyx/pandora

# completions for the tools I use the most/I hope
# I could potentially sort them out to another repo .. will see
use ./completions/io
use ./completions/k
use ./completions/wren

use ./util

# using the starship prompt
eval (starship init elvish)

# "aliases" in elvish

# neovim
fn nv  {|@a| e:nvim $@a }
fn vi  {|@a| e:nvim $@a }
fn vim {|@a| e:nvim $@a }

# list files
fn l   {|@a| e:lsd              $@a }
fn ls  {|@a| e:lsd              $@a }
fn la  {|@a| e:lsd --all        $@a }
fn ll  {|@a| e:lsd --long       $@a }
fn lla {|@a| e:lsd --long --all $@a }

fn tree {|@a| e:lsd --tree $@a }

# snobol
fn snb {|@a| e:snobol4 $@a }

# git
fn g   {|@a| git                   $@a }
fn ga  {|@a| git add               $@a }
fn gc  {|@a| git commit            $@a }
fn gp  {|@a| git push              $@a }
fn gap {|@a| git add --patch       $@a }
fn gcm {|@a| git commit -m         $@a }
fn gpa {|@a| git push origin --all $@a }

# => https://github.com/mithrandie/csvq
fn cq {|@a| csvq $@a }

# some useful functions
fn t {|| e:date -I | e:clip; echo "Copied todays date into clipboard" }
fn pyra {|backend file| e:lua (util:find-file pyra) $backend $file }
fn md {|file| e:perl "~/AppData/Local/Markdown/Markdown.pl" $file }
fn rot { tr 'A-Za-z' 'N-ZA-Mn-za-m' }
fn integrity {|file|
  echo "sha256-"(cat $file | openssl dgst -sha256 -binary | openssl base64 -A)
}
fn depth {
  + (math:max (lsd -1d **/* --icon never | each {|f| str:count $f "/" })) 1
}

# todays date in elvish
date-elv:date-elv -Q "%A, %B %d, %Y %T"
# todays date in arvelie & neralie
echo (e:arvelie), (e:neralie)
echo (str:split "  " (str:trim-left (e:tsuyu -s) " ") | str:join ", ")

set E:EDITOR = "edit"
set E:COLORTERM = "truecolor"

set E:LEDGER_FILE = "~/private/finance/"(date '+%Y')".journal"

# a very basic walk, like my nushell functions
var bm = (cat ~/.config/bm.json | from-json)
set edit:completion:arg-completer[walk] = (comp:subcommands $bm)

fn walk {|where| if (has-key $bm $where) { cd $bm[$where] }}

fn roms { pprint [~/bin/uxn/*.rom] }

# all the uxn roms on my pc
fn drifblim {|@a| e:raven-cli.exe ~/bin/uxn/drifblim.rom -- $@a }
fn talos    {|@a| e:raven-cli.exe ~/bin/uxn/talos.rom    -- $@a }
fn uxnbal   {|@a| e:raven-cli.exe ~/bin/uxn/uxnbal.rom   -- $@a }
fn uxndis   {|@a| e:raven-cli.exe ~/bin/uxn/uxndis.rom   -- $@a }
fn uxnfor   {|@a| e:raven-cli.exe ~/bin/uxn/uxnfor.rom   -- $@a }
fn uxnlin   {|@a| e:raven-cli.exe ~/bin/uxn/uxnlin.rom   -- $@a }
