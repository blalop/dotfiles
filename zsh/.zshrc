export ZSH="/home/alex/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="true"

ZSH_THEME="agnoster"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias ls="ls --color=always --group-directories-first"
alias ll="ls -lh --color=always --group-directories-first"
alias la="ls -a --color=always --group-directories-first"
alias lla="ls -lah --color=always --group-directories-first"

export EDITOR=vim

