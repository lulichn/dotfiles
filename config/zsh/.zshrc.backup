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
  eval "$(anyenv init - --no-rehash)"
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

# OCaml
(($+commands[opam])) && eval $(opam env)

# android sdk
if [ -d $HOME/Library/Android/sdk ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  path=(
    $ANDROID_HOME/emulator
    $ANDROID_HOME/tools
    $ANDROID_HOME/tools/bin
    $ANDROID_HOME/platform-tools
    $path
  )
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

