" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'

" PHP Specific Bundles
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'docteurklein/php-getter-setter.vim'

call vundle#end() 
" Vundle"

" Backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Appearance
syntax on
filetype plugin indent on
set number
set autoindent
set smartindent                                    
set smarttab
set mouse=a
set shiftwidth=3
set softtabstop=3
set nowrap
set encoding=utf-8 
set history=1000
set undolevels=1000

colorscheme lucius
LuciusDark

" Nerdtree
""autocmd VimEnter * if !argc() | NERDTree | endif

" Autocomplete
autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Syntastic
let g:syntastic_php_checkers = ['php']

" Taglist
let tlist_php_settings='php;f:function'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

" Mappings -------------------------------

let mapleader=","

nnoremap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>t :TlistToggle<CR>

" Save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Switching Splits"
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Mappings -------------------------------
