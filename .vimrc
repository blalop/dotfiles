" colors
syntax on
"colorscheme onedark

" Tabs
set tabstop=4 "visual spaces per tab
set softtabstop=4 "spaces in tab
set expandtab "tab as spaces

" Indent
set smartindent
set autoindent

" UI
set number
set wildmenu
set showcmd
set lazyredraw
set showmatch
set ruler

" Settings
set hidden
set nowrap

" Search related stuff
set hlsearch

" Folding
set foldenable
set foldlevelstart=8

" Map auto complete of (, ", {, ', [
:inoremap ( ()<Esc>:let leavechar=")"<CR>i
:inoremap [ []<Esc>:let leavechar="]"<CR>i
:inoremap { {}<Esc>:let leavechar="}"<CR>i
:inoremap " ""<Esc>:let leavechar="""<CR>i
:inoremap ' ''<Esc>:let leavechar="'"<CR>i
