set nocompatible

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

set backspace=indent,eol,start "Normal backspace function
set softtabstop=4 "Tab equals 4 whitespaces
set expandtab "Use spaces instead of tabs
set showcmd " Show (partial) command in status line
set showmatch " Show matching brackets
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
set hidden " Hide buffers when they are abandoned
set number " Show line number
