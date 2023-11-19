# ------------
# Functions
# ------------
FPATH=$FPATH:$ZDOTDIR/functions

# fasd + fzf
autoload -U fasd-fzf-search
zle -N fasd-fzf-search
bindkey '^f' fasd-fzf-search

# ghq + fzf
autoload -U ghq-fzf
zle -N ghq-fzf
bindkey '^q' ghq-fzf
