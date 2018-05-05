
# Zsh Config
export ZSH=/home/alex/.oh-my-zsh
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
HYPHEN_SENSITIVE="true"
export UPDATE_ZSH_DAYS=14
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Exports
export GEM_HOME=/home/alex/.gem/ruby/2.5.0
export EDITOR=vim

# Aliases
source .aliases

# On-boot
neofetch
