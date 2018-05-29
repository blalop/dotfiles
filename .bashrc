#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='\W ➜ '

# Envars
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export PATH=$PATH:~/.gem/ruby/2.5.0/bin:~/go/bin:~/.npm-packages/bin
export EDITOR="vim"
export GEM_HOME=/home/alex/.gem/ruby/2.5.0

# TAB completion
bind 'TAB: menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set page-completions off'
bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'

# History completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Aliases
alias ls="ls --group-directories-first --color=always"
alias ll="ls -la"
alias fuck="sudo !!"

