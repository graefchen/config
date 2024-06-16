# my .bashrc file
# that is loaded from the ~/.bashrc file
# with the help of source

# these are the code for changig the
# brigthness of the console
bold='\E[1m'
dim='\E[2m'
# foreground colours
fg_black='\E[30m'
fg_red='\E[31m'
fg_green='\E[32m'
fg_yellow='\E[33m'
fg_blue='\E[34m'
fg_magenta='\E[35m'
fg_cyan='\E[36m'
fg_white='\E[37m'
# background colours
bg_black='\E[40m'
bg_red='\E[41m'
bg_green='\E[42m'
bg_yellow='\E[43m'
bg_blue='\E[44m'
bg_magenta='\E[45m'
bg_cyan='\E[46m'
bg_white='\E[47m'
# the ansi escape code that resets all the colours
reset='\E[0m'

# WELCOME MESSAGES
# What is printed at the start
# a coloured one that looks like the " *  History restored " prompt in vs code
# there is a zero with joiner behind $reset to not make problems with the dumb system of vscode
# echo -e "$bg_white$fg_black * $reset$bg_blue$fg_bright_black Console started $reset‍"
# normal ASCI one
# echo "=========================="
# echo "==<Bash console started>=="
# Fallout 4 Welcome Messages
# echo "Welcome to ROBCO Industries (TM) Termlink"
# echo "==== Institute Central Network ===="
# echo "--- *ALERT* --- "

# Some aliases
# list alias
alias l="lsd"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias tree='lsd --tree'

# cd alias
alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# set nvim alias
alias neovim='nvim'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'

# helper alias
# alias re='source ~/.bashrc'
# c compiler alias
alias cc='clang'

# git alias
# alias glg="git log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)' --abbrev-commit --date=relative"
# alias g='git'
# alias gc='git commit'
# alias gcm='git commit -m'
# alias gap='git add --patch'
# alias gp='git push'

# hexviewer alias
# alias hexyl='hexyl --border ascii'

# alias fresh='deno run -A -r https://fresh.deno.dev'
# alias lume='deno run -A https://lume.land/init.ts'

# language in the shell
# LANG=de.UTF8

# Setting the console to truecolor so 
# that onefetc can display the
# language logos in the correct colour
export COLORTERM='truecolor'

# Setting to allow nvim / (vim)
# to use the .config folder as the
# config home
export XDG_CONFIG_HOME='C:\\Users\Graef\.config'

# starship config
# the default config of plain text will be choosen
eval "$(starship init bash)"
# how an very very old conputer prompt looked like
# export STARSHIP_CONFIG=~/.config/starship/oldship.toml
# jdh config
# export STARSHIP_CONFIG=~/.config/starship/jdh_starship.toml
# animalship config
export STARSHIP_CONFIG=~/.config/starship/animalship.toml
# a pure ansi ship with more additions that the normal starship does not have
# export STARSHIP_CONFIG=~/.config/starship/ansiship.toml
# a pure emoji config
# export STARSHIP_CONFIG=~/.config/starship/emojiship.toml
# a small project with emotes
# export STARSHIP_CONFIG=~/.config/starship/smallproject.toml
# the normal starship prompt
# export STARSHIP_CONFIG=~/.config/starship/normal.toml
# a costum complex version
# export STARSHIP_CONFIG=~/.config/starship/complex.toml

export PATH=$PATH:~/programming/bash:~/programming/c/repos/colours:~/programming/powershell:~/programming/awk:~/programming/nu

function adog {
	git log --all --decorate --oneline --graph
}

function log {
	 git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
		--format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %C(bold blue)<%an>%C(reset)%C(reset)%C(bold yellow)%d%C(reset)'
	echo ""
}
