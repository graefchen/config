$env.COLORTERM = "truecolor"
# Configuration for starship
mkdir ~/.cache/starship
starship init nu | save -f "~/.cache/starship/init.nu"

# getting todays date as ISO 8601 format
def today [] { return (date now | format date "%F") }

# hello, message
print $"(arvelie), (neralie)"
pkmnday
