#
# ~/.bashrc
#

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='\W ➜ '

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

