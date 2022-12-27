# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

TMUX_CONFIG="~/.config/tmux/.tmux.conf"

# TMUX Related Aliases
alias                                 \
  tn="tmux -u -f $TMUX_CONFIG new"    \
  ta="tmux -u -f $TMUX_CONFIG attach" \
  tt="nvim $TMUX_CONFIG"

alias colorscheme="~/bin/colorscheme"
