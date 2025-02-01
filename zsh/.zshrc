# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

# zsh Aliases
alias sc="source $HOME/.zshrc"

# Git Aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcb="git checkout -B"
alias gco="git checkout"
alias gb="git branch"
alias gpl="git pull"
alias gps="git push"

alias grep="grep -n --color"
alias vi="nvim"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Zig development
export PATH="$HOME/.zm/current:$PATH"

# starship.rs
eval "$(starship init zsh)"
