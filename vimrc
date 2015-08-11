" skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    " turn off vi compatability
    if &compatible
        set nocompatible
    endif
endif

" required by pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" dark colors
set background=dark

" swap between buffers without needing to save
set hidden

" none of these are word dividers
set iskeyword+=_,#

 " line numbers
set number

" optimize macro execution by not redrawing until macro is finished
set lazyredraw

" hilight tabs and trailing spaces
set list
set listchars=tab:-.,trail:.

" show matching brackets
set showmatch

" leave 5 rows of space when scrolling
set scrolloff=5

" text formatting
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4 " make real tabs 4 wide

" GUI setup and colors
if has("gui_running")
    set guifont=Lucida\ Console\ Semi-Condensed\ 14
    set guioptions-=m   " remove menu bar
    set guioptions-=T   " remove toolbar
    set guioptions-=r   " remove right-hand scroll bar
    set guioptions-=l   " remove left-hand scroll bar
endif
colorscheme desert

" Airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

