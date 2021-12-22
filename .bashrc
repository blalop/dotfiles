#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

[[ $- != *i* ]] && return # If not running interactively, don't do anything

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make less more friendly for non-text input files, see lesspipe(1)

# History
HISTCONTROL=ignoreboth,erasedups
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend # append to the history file, don't overwrite it
shopt -s checkwinsize # check window size after each command
shopt -s globstar # pattern "**" matches recursively
shopt -s cdspell # Autocorrect typos in path names when using `cd`
shopt -s nocaseglob # Case-insensitive globbing (used in pathname expansion)

PS1="\[\e[1;34m\]>\[\e[m\] "
PS2="\[\e[34m\]>\[\e[m\] "

export EDITOR=vi

# Development
export GOPATH="$HOME/.go"
export GEM_HOME="$HOME/.gems"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

# Aliases
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"
alias ls='ls --color=auto --group-directories-first'
alias ll="LC_COLLATE=C ls -lhFN"
alias la="ll -a"
alias tree="tree -aC -I '.git' --dirsfirst"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'  # usage: command; alert
alias timestamp="date +%Y%m%d%H%M%Sa"
alias open="xdg-open"
