" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/AutoClose'
Plugin 'vim-scripts/taglist.vim'

" PHP Specific Bundles
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'docteurklein/php-getter-setter.vim'

call vundle#end() 

" Appearance
syntax on
filetype plugin indent on
set number
set autoindent
set mouse=a
set shiftwidth=3
set softtabstop=3
set nowrap

colorscheme lucius
LuciusDark

" Autocomplete
autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Mappings -----

let mapleader=","

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

"CtrlP
nmap <leader>f :CtrlP<CR>

"Tagbar
nmap <leader>o :TagbarToggle<CR>

" Save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

map <C-j> <C-w>j
map <C-k> <C-w>k
