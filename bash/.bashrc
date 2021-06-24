#!/bin/bash

[[ $- != *i* ]] && return

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -d /etc/bash_completion.d/ ]; then
    for file in /etc/bash_completion.d/* ; do
        source "$file"
    done
fi

if [ -f ~/.functions ]; then
    source ~/.functions
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

PS1="\
\e[32m\u\e[m \
at \e[36m\h\e[m \
in \e[35m\W\e[m \
time \e[33m\t\e[m\
\$(__git_ps1 ' on \e[34m%s\e[m')\
\`__error_ps1\`
> "
PS2="> "

export EDITOR=vim

export GOPATH="$HOME/.go"

export GEM_HOME="$HOME/.gems"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"
alias ls='ls --color=auto --group-directories-first'
alias ll="LC_COLLATE=C ls -lhFN"
alias la="ll -a"
alias tree="tree -aC -I '.git' --dirsfirst"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias map="xargs -n1"
alias timestamp="date +%Y%m%d%H%M%Sa"
alias open="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias www="python3 -m http.server"
alias urlencode='python3 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias chrome="/opt/google/chrome/chrome"
