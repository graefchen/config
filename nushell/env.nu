$env.COLORTERM = "truecolor"
# Configuration for starship
mkdir ~/.cache/starship
starship init nu | save -f "~/.cache/starship/init.nu"

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

# gnu cat has some funny querks
alias cat = bat

alias snb = snobol4

$env.EDITOR = "nvim"
$env.ZEIT_DB =  ($env.XDG_CONFIG_HOME | path join 'zeit.db')

# getting todays date as ISO 8601 format
def today [] { return (date now | format date "%F") }

# get the wordcount of all md, org and txt files in your current location
def --env wordcount [--depth(-d): int = 4] {
    ls --threads ...(glob --depth $depth **/*.{md,org,txt})
    | where type == file
    | each {|x| open $x.name | str stats | insert name $x.name }
    | move name --before lines
    | update name { $in | str replace $"(pwd)" "."}
}

# return the sha256 integrity of a file (for the web)
#
# like: cat FILENAME.js | openssl dgst -sha256 -binary | openssl base64 -A
def integrity [file: path]: nothing -> string {
    return $"sha256-(open $file | hash sha256 -b | encode base64)"
}

# hello, message
print $"(arvelie), (neralie)"
# pkmnday
tsuyu -s | split row "  " | where (is-not-empty) | str join ", "

# [[animal,fish];[cow,koi],[bat,catfish]]
