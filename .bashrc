#!/bin/bash
# my .bashrc file
# that is loaded from the ~/.bashrc file
# with the help of source

# WELCOME MESSAGES
# normal ASCI one
# Fallout 4 Welcome Messages
# echo "Welcome to ROBCO Industries (TM) Termlink"
# echo "==== Institute Central Network ===="
# echo "--- *ALERT* --- "

# Some aliases

# list alias
# alias l="lsd"
# alias ls="lsd"
# alias la="lsd -a"
# alias ll="lsd -l"
# alias lla="lsd -la"
# alias tree='lsd --tree'

# cd alias
# alias ..="cd .."
# alias ...='cd ../..'
# alias ....='cd ../../..'
# alias .....='cd ../../../..'

# nvim alias
alias neovim='nvim'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'

# c compiler alias
alias cc='clang'

# git alias
alias gl="git log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)' --abbrev-commit --dabash=relative"
alias g='git'
alias gc='git commit'
alias gcm='git commit -m'
alias gap='git add --patch'
alias gp='git push'

alias fresh='deno run -A -r https://fresh.deno.dev'
alias lume='deno run -A https://lume.land/init.ts'

# Setting the console to truecolor so 
# that onefetch can display the
# language logos in the correct colour
export COLORTERM='truecolor'

# starship config
# the default config of plain text will be choosen
# looks for starship.toml in the .config filder
eval "$(starship init bash)"

export PATH=$PATH:~/programming/bash:~/programming/awk

# some functions

function adog {
	git log --all --decorate --oneline --graph
}

function log {
	git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
		--format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %C(bold blue)<%an>%C(reset)%C(reset)%C(bold yellow)%d%C(reset)'
	echo ""
}
