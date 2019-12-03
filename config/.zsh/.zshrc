##
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/prezto/init.zsh"
fi

function load-if-exists() { test -e "$1" && source "$1" }

export HISTCONTROL=ignoreboth

############################################################

# fasd
export _FASD_DATA=$ZDOTDIR/fasd

############################################################

# fzf
export FZF_DEFAULT_OPTS="--layout=reverse"

############################################################

# functions
FPATH=$FPATH:$ZDOTDIR/functions
autoload -U ssh-ec2

# fasd + fzf
autoload -U fasd-fzf-search
zle -N fasd-fzf-search
bindkey '^f' fasd-fzf-search

# ghq + fzf
autoload -U ghq-fzf
zle -N ghq-fzf
bindkey '^q' ghq-fzf

############################################################

# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# jabba
if [ -d $HOME/.jabba ]; then
  . $HOME/.jabba/jabba.sh
fi

# sdkman
if [ -d $HOME/.sdkman ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Cargo
if [ -d $HOME/.cargo ]; then
  source $HOME/.cargo/env
fi

############################################################

[ -f $ZDOTDIR/.zshrc_`uname` ] && source $ZDOTDIR/.zshrc_`uname`

# config
for i in $ZDOTDIR/config/*.zsh; do
  source $i
done

############################################################

##
## Profiling
##
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

