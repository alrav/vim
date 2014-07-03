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
"Plugin 'vim-scripts/AutoClose'
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
set mouse=a
set shiftwidth=3
set softtabstop=3
set nowrap

colorscheme lucius
LuciusDark

" Autocomplete
autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Syntastic
let g:syntastic_php_checkers = ['php']

" Taglist
let tlist_php_settings='php;f:function'

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
