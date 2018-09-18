syntax on
filetype indent plugin on

set tabstop=4
set softtabstop=4
set expandtab

set autoindent

set ignorecase
set smartcase
set hlsearch

set number
set wildmenu
set showcmd
set lazyredraw
set showmatch
set ruler
set hidden
set nowrap

set nobackup
set nowb
set noswapfile

set backspace=indent,eol,start
set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
