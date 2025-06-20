# Nushell Environment Config File
#
# version = "0.94.2"

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)

$env.COLORTERM = "truecolor"

# Configuration for starship
mkdir ~/.cache/starship
starship init nu | save -f "~/.cache/starship/init.nu"

alias fresh = deno run -A -r https://fresh.deno.dev
alias lume = deno run -A https://lume.land/init.ts

alias g = git
alias gl = git log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)' --abbrev-commit --date=relative
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
