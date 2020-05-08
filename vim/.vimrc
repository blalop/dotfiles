" settings
set encoding=utf-8
set autowrite
set noswapfile
set hidden
set fileformats=unix,dos,mac

" looks
filetype plugin indent on
syntax on
set number
set noerrorbells

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
if has('mouse')
    set mouse=a
endif

" allow going left
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" render boundary whitespaces
set list
set listchars=trail:·,tab:>·

" mappings
:inoremap ( ()<Esc>:let leavechar=")"<CR>i
:inoremap [ []<Esc>:let leavechar="]"<CR>i
:inoremap { {}<Esc>:let leavechar="}"<CR>i
:inoremap " ""<Esc>:let leavechar="""<CR>i
:inoremap ' ''<Esc>:let leavechar="'"<CR>i

if has('unnamedplus')
    set clipboard=unnamedplus
endif

" automatic commands
if has("autocmd")
    " remember position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

