# Dalton Petursson's Bash Profile at Shift Technologies


# Aliases
alias ~="cd ~"
alias ..="cd .."
alias cd..="cd .."
alias ls="ls -Gp"
alias lsd="ls -alh"
alias psdl="ps auxwww | less"
alias c='clear'
alias vims='vim -S'

# Editor of choice
export EDITOR=vim

# git aliases
alias glg="git log --oneline --abbrev-commit --all --graph --decorate"

# git completion, assumes this .dotfiles repo is in the home directory
source ~/.dotfiles/git-completion.bash

# Go environment
# export PATH=$PATH:/usr/local/go/bin

# Go App Engine SDK
export PATH=/Users/Dalton/go_appengine:$PATH

# shiftforce tool aliases
alias sfbp="/Users/Dalton/Code/expts/shiftbulk/shiftforce_bulk_post.sh"
