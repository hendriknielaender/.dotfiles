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

alias ls="ls --color -la -h"
alias grep="grep -n --color"
alias vi="nvim"
alias colorscheme="~/bin/colorscheme"
alias zs="~/bin/zellij-sessionizer"

bindkey -s ^f "zs"

# TMUX Related Aliases
TMUX_CONFIG="~/.config/tmux/.tmux.conf"

alias                                 \
  tn="tmux -u -f $TMUX_CONFIG new"    \
  ta="tmux -u -f $TMUX_CONFIG attach" \
  tt="nvim $TMUX_CONFIG"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Zig development
# export PATH=$PATH:~/zig
export PATH="$HOME/.zvm/current:$PATH"

# starship.rs
export STARSHIP_CONFIG="~/.config/starship/starship.toml"
eval "$(starship init zsh)"
