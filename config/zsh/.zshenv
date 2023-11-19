
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Path
path=(
  $HOME/bin(N-/)
  $path
)

[ -f $ZDOTDIR/.zshenv.`uname` ] && source $ZDOTDIR/.zshenv.`uname`
