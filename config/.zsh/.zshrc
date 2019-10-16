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

# sdkman
if [ -d $HOME/.sdkman ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

############################################################

[ -f $ZDOTDIR/.zshrc_`uname` ] && source $ZDOTDIR/.zshrc_`uname`

# config
for i in $ZDOTDIR/config/*.zsh; do
  source $i
done

if [ -d $HOME/works/.zsh/config ]; then
  for i in $HOME/works/.zsh/config/*.zsh; do
    source $i
  done
fi

############################################################

##
## Profiling
##
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

