
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell

bind 'TAB: menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set page-completions off'
bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

export PS1='> '
export PS2='> '
export EDITOR=vim
