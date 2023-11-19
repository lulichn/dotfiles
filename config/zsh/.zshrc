
export HISTCONTROL=ignoreboth

# Get the directory of the currently executing Zsh script. 
ZSHRC_DIR=${${(%):-%N}:A:h}

# Key bindings
bindkey -e # emacs key bindings

# Ctrl-s, Ctrl-q によるフロー制御を無効にする
setopt no_flow_control

# 設定ファイルの読み込み
for cfg in $ZDOTDIR/config/*.zsh; do source $cfg; done

# fzf
export FZF_DEFAULT_OPTS="--layout=reverse"

# direnv
(($+commands[direnv])) && eval "$(direnv hook zsh)"

# anyenv
if [ -d $HOME/.anyenv ]; then
  path=($HOME/.anyenv/bin(N-/) $path)
  eval "$(anyenv init - --no-rehash)"
fi


[ -f $ZDOTDIR/.zshrc.`uname` ] && source $ZDOTDIR/.zshrc.`uname`
