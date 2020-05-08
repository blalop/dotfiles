#!/bin/bash

[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


if [ -d /etc/bash_completion.d/ ]; then
    for file in /etc/bash_completion.d/* ; do
        source "$file"
    done
fi

shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell
shopt -s nocaseglob

export PS1='> '
export PS2='> '
export EDITOR=vim

export GOPATH="$HOME/.go"
export GEM_HOME="$HOME/.gems"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias ls='ls --color=auto --group-directories-first'
alias ll="LC_COLLATE=C ls -lhFN"
alias la="ll -a"
alias clr="clear"

alias timestamp="date +%Y%m%d%H%M%Sa"
alias intip="ip route get 1 | awk '{print \$(NF-2);exit}'"
alias extip="curl --silent -4 https://icanhazip.com"
alias open="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias ports="netstat -tulpn"
alias webserv="python3 -m http.server"

