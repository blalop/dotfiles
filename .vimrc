" looks
filetype plugin indent on
syntax on
set noswapfile
set hidden

" menu
set showcmd
set wildmenu
set ruler

" search
set hlsearch
set ignorecase
set smartcase

" indent and tabs
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab

" allow mouse
set mouse=a

" allow going left
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" render boundary whitespaces
set list
set listchars=trail:·,tab:»·

" clipboard (needs vim-gtk3)
set clipboard=unnamedplus

" automatic commands
if has("autocmd")
    " remember position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

