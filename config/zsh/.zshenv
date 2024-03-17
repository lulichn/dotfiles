# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Path
path=(
  $HOME/bin(N-/)
  $HOME/.anyenv/envs/nodenv/shims(N-/)
  $HOME/.yarn/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/.config/yarn/global/node_modules/.bin(N-/)
  $HOME/bin/flutter/bin(N-/)
  $HOME/go/bin(N-/)
  $path
)

[ -f $ZDOTDIR/.zshenv.`uname` ] && source $ZDOTDIR/.zshenv.`uname`
[ -f $HOME/works/.zsh/zshenv.local ] && source $HOME/works/.zsh/zshenv.local
