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

alias l   = ls
alias la  = ls --all
alias ll  = ls --long
alias lla = ls --long --all

alias neovim = nvim
alias vi = nvim
alias vim = nvim
alias nv = nvim

alias snb = snobol4

$env.EDITOR = "nvim"
$env.ZEIT_DATABASE =  ($env.XDG_CONFIG_HOME | path join 'zeit.db')

$env.LEDGER_FILE = $"~/private/finance/(date now | format date "%Y").journal"

def yesterday [] { return ("yesterday" | date from-human | format date "%F") }
# getting todays date as ISO 8601 format
def today [] { return (date now | format date "%F") }
def tomorrow [] { return ("tomorrow" | date from-human | format date "%F") }
def --env md [dir: string] { mkdir $dir; cd $dir }

# list all files in the bin folder
def "binary list" [] {
    ls ($env.HOMEPATH | path join "bin")
    | each { $in | update name {|i| $i.name | path parse | get stem } }
}

# move the specified file(s) into the bin folder
def "binary" [...files: path] {
    for $f in $files { mv $f ($env.HOMEPATH | path join "bin") }
}

# get the wordcount of all md, org and txt files in your current location
def --env wordcount [--depth(-d): int = 4] {
    ls --threads ...(glob --depth $depth **/*.{md,org,txt})
    | where type == file
    | each {|x| open $x.name | str stats | insert name $x.name }
    | move name --before lines
    | update name { $in | str replace $"(pwd)" "."}
}

# return the sha256 integrity of a file (for the web)
def integrity [file: path]: nothing -> string {
    return $"sha256-(open -r $file | hash sha256 -b | encode base64)"
}

# hello, message
print $"(arvelie), (neralie)"
print $"(tsuyu -s | split row '  ' | where (is-not-empty) | str join ', ')"

# [[animal,fish];[cow,koi],[bat,catfish]]

# print all go apps
def goapps []: nothing -> list<string> {
    ls ($env.GOPATH | path join "bin") | get name | split column "\\" | get column6 | split column "." | get column1
}
# print all rust apps
def rustapps []: nothing -> list<string> {
    cargo install --list | split row "\n" | split column " " | get column1 | uniq | sort | reverse | drop | reverse
}

# small little conventional commits helper
def "commit" [] {
    let type = (gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
    mut scope = (gum input --placeholder "scope")
    if ($scope != "") {$scope = $"\(($scope)\)" }
    let summary = (gum input --value $"($type)($scope): " --placeholder "Summary of this change")
    let details = (gum write --placeholder "Details of this change")
    gum confirm "Commit changes?"
    if ($env.LAST_EXIT_CODE == 0) {
        git commit -m $"($summary)" -m $"($details)"
    }
}