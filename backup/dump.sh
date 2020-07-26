#!/bin/zsh

BASE=$(dirname $0)

PREFIX=$(date "+%Y%m%d%H%M%S")_$(uname -n)

code --list-extensions > ${BASE}/${PREFIX}_code.extensions.txt
ls /Applications/      > ${BASE}/${PREFIX}_applications.txt
defaults read          > ${BASE}/${PREFIX}_defaults.txt
