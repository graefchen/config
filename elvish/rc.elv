# ~/.elvish/rc.elv

use str

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

use ./completions/io
use ./completions/k
use ./completions/wren

use ./misc
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

# some useful functions
fn t {||
  e:date -I | e:clip
  echo "Copied todays date into clipboard"
}

fn pyra {|backend file| e:lua (util:find-file pyra) $backend $file }

fn md {|dir|
  mkdir -p $dir
  cd $dir
}

# todays date in elvish
date-elv:date-elv -Q "%A, %B %d, %Y %T"
# todays date in arvelie & neralie
echo (e:arvelie), (e:neralie)
echo (str:split "  " (str:trim-left (e:tsuyu -s) " ") | str:join ", ")
