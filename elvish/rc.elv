# ~/.elvish/rc.elv

# using modules
use github.com/jkbr-19/sindarin-term/date-elv

# using the starship prompt
eval (starship init elvish)

# "aliases" in elvish
fn nv  {|@a| e:nvim    $@a }
fn snb {|@a| e:snobol4 $@a }

# todays date in elvish
date-elv:date-elv -Q "%A, %B %d, %Y %T"
# todays date in arvelie
echo (arvelie), (neralie)
