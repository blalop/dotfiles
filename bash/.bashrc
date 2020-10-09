#!/bin/bash

[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
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

__error_ps1() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $' exited \e[31m'
    echo -n $code
    echo -n $'\e[m'
  fi
}

export PS1="\
\e[32m\u\e[m \
at \e[36m\h\e[m \
in \e[35m\W\e[m \
time \e[33m\t\e[m\
\$(__git_ps1 ' on \e[34m%s\e[m')\
\`__error_ps1\`
> "
export PS2="> "

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
alias diff="diff --color"
alias ls='ls --color=auto --group-directories-first'
alias ll="LC_COLLATE=C ls -lhFN"
alias la="ll -a"
alias clr="clear"

alias timestamp="date +%Y%m%d%H%M%Sa"
alias open="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias webserv="python3 -m http.server"
