alias vi="vim"

alias g="git"
alias gs="git status"
alias gd="git diff"

if (( $+commands[docker] )); then
  alias d='docker'
  alias ddps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
  alias ddcontainer='docker ps -a --format "{{.ID}}\t{{.Status}}" | grep -v 'Up' | cut -f1 | xargs docker rm'
  alias ddcontainerall='docker ps -q | xargs docker rm -f'
  alias ddimage='docker images -q -f dangling=true | xargs docker rmi'
  alias ddvolume='docker volume ls -qf dangling=true | xargs docker volume rm'
  alias ddexec='docker exec -it `ddps | fzf | cut -f 1` /bin/bash'
fi

