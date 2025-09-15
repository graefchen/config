# Nushell Environment Config File

$env.COLORTERM = "truecolor"

# Configuration for starship
mkdir ~/.cache/starship
starship init nu | save -f "~/.cache/starship/init.nu"

alias fresh = deno run -A -r https://fresh.deno.dev
alias lume = deno run -A https://lume.land/init.ts

alias g = git
alias gl = git log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)' --abbrev-commit --date=relative
alias glf = git log --pretty=format:'%C(yellow)%H%C(reset) %C(blue)(%as)%C(reset) %s'
alias gc = git commit
alias gcm = git commit -m
alias gap = git add --patch
alias ga = git add
alias gp = git push
alias gpa = git push origin --all

alias neovim = nvim
alias vi = nvim
alias vim = nvim
alias nv = nvim

# tree alias
alias tree = lsd --tree

# c compiler
# alias clang = clang -Wall -Werror -pedantic -fsanitize=address

# alias for coreutils
alias uu = coreutils

$env.NAP_CONFIG = "~/.config/nap/config.yaml"
$env.NAP_HOME = "~/.config/nap"
$env.NAP_DEFAULT_LANGUAGE = "txt"
$env.NAP_THEME = "nord"

$env.EDITOR = "nvim"

$env.ZEIT_DB =  ($env.XDG_CONFIG_HOME | path join 'zeit.db')

def alp [-b]: nothing -> string {
    if ($b) { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    return "abcdefghijklmnopqrstuvwxyz"
}

# command line games
alias rpg = rpg-cli

# working with dates

# getting todays date
# as ISO 8601 format
def today [] {
    return (date now | format date "%F")
}

# get the wordcount of all md, org and txt files in your current location
def --env wordcount [--depth(-d): int = 4] {
    ls --threads ...(glob --depth $depth **/*.{md,org,txt})
    | where type == file
    | each {|x| open $x.name | str stats | insert name $x.name }
    | move name --before lines
    | update name { $in | str replace $"(pwd)" "."}
}

# getting the current disk space
def --env ds [] {
    du --max-depth 8
    | sort-by apparent
    | update path { path basename }
}

# return the sha256 integrity of a file (for the web)
#
# like: cat FILENAME.js | openssl dgst -sha256 -binary | openssl base64 -A
def integrity [file: path]: nothing -> string {
    return $"sha256-(open $file | hash sha256 -b | encode base64)"
}
