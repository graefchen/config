# ~/.elvish/rc.elv

# using modules
use github.com/jkbr-19/sindarin-term/date-elv

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
fn g   {|@a| git                   $@a}
fn ga  {|@a| git add               $@a}
fn gc  {|@a| git commit            $@a}
fn gp  {|@a| git push              $@a}
fn gap {|@a| git add --patch       $@a}
fn gcm {|@a| git commit -m         $@a}
fn gpa {|@a| git push origin --all $@a}

# some useful functions
fn t {||
  e:date -I | e:clip
  echo "Copied todays date into clipboard"
}

# todays date in elvish
date-elv:date-elv -Q "%A, %B %d, %Y %T"
# todays date in arvelie & neralie
echo (e:arvelie.exe), (e:neralie.exe)
echo (e:pkmnday)