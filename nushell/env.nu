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

alias snb = snobol4

$env.EDITOR = "nvim"
$env.ZEIT_DATABASE =  ($env.XDG_CONFIG_HOME | path join 'zeit.db')

# getting todays date as ISO 8601 format
def today [] { return (date now | format date "%F") }
def --env md [dir: string] { mkdir $dir; cd $dir }

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