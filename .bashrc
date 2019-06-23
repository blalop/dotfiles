#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Read system-wide config
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


# Prompt
export PS1="\[\e[1;34m\]\u\[\e[m\] at \[\e[1;32m\]\h\[\e[m\] in \[\e[1;35m\]\W\[\e[m\] > "

# Envars
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export EDITOR="vim"

# TAB completion
bind 'TAB: menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set page-completions off'
bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# History completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Aliases
alias ls="ls --group-directories-first --color=always"
alias ll="ls -la"

