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

# direnv
(($+commands[direnv])) && eval "$(direnv hook zsh)"

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

# mise
# eval "$(mise activate zsh)"

# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - --no-rehash)"
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

[ -f $ZDOTDIR/.zshrc.`uname` ] && source $ZDOTDIR/.zshrc.`uname`

# config
for i in $ZDOTDIR/config/*.zsh; do
  source $i
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daisukh/dev/libs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/daisukh/dev/libs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daisukh/dev/libs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/daisukh/dev/libs/google-cloud-sdk/completion.zsh.inc'; fi

############################################################

##
## Profiling
##
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
