#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# Read system-wide config
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prompt
export PS1="\[\e[1;32m\]\W\[\e[m\]\[\e[1;34m\] >\[\e[m\] "
export PS2="\[\e[1;34m\]>\[\e[m\] "


# History completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# TAB completion
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

## alias

# always list with color and with directories first
alias ls="ls --color=always --group-directories-first"

# list with color and long format
alias ll="ls -lh --color=always --group-directories-first"

# list hidden with color and with directories first
alias la="ls -a --color=always --group-directories-first"

# list hidden with color, long format and with directories first
alias lla="ls -lah --color=always --group-directories-first"

# cat with color
alias ccat="highlight -O ansi"

## path

# add ruby gems path
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

## exports

# history
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "

export EDITOR="vim"

