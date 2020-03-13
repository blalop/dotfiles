#!/bin/bash

[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi


shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell

source /usr/lib/git-core/git-sh-prompt
export PS1='\[\e[1;34m\]\u\[\e[m\] at \[\e[1;32m\]\h\[\e[m\] in \[\e[1;35m\]\W\[\e[m\]$(__git_ps1 " branch \[\e[1;33m\]%s\[\e[m\]"): '
export PS2=': '

bind 'TAB: menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set page-completions off'
bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

alias ls="ls --color=always --group-directories-first"
alias ll="ls -lh --color=always --group-directories-first"
alias la="ls -a --color=always --group-directories-first"
alias lla="ls -lah --color=always --group-directories-first"
alias ccat="highlight -O ansi"

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "

export EDITOR="vim"

source ~/.profile
