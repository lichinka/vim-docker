" skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    " turn off vi compatability
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ----------------
" used bundles
" ----------------
" sensible defaults
NeoBundle 'tpope/vim-sensible'
" airline status bar
NeoBundle 'bling/vim-airline'
" awesome git!
NeoBundle 'tpope/vim-fugitive'
" git in the gutter
NeoBundle 'airblade/vim-gitgutter'
" use silver searcher in place of grep
NeoBundle 'rking/ag.vim'
" control-p for finding files
NeoBundle 'kien/ctrlp.vim'

if v:version > 703
    " provides fuzzy completer and clang based cleverness
    NeoBundle 'Valloric/YouCompleteMe', {
         \ 'build'      : {
            \ 'mac'     : './install.sh --clang-completer',
            \ 'unix'    : './install.sh --clang-completer',
            \ }
         \ }
endif

call neobundle#end()

" required by neobundle
filetype plugin indent on

" prompt to install uninstalled bundles found on startup
NeoBundleCheck

set background=dark

" syntax hilighting
syntax on

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

" install neobundle plugins
autocmd VimEnter * NeoBundleInstall
