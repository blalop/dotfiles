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
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin:$HOME/code/go/bin:$HOME/.npm-packages/bin
export EDITOR="vim"
export GEM_HOME=$HOME/.gem/ruby/2.5.0
export GOPATH=$HOME/code/go

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
alias fuck='sudo $(history -p \!\!)'

