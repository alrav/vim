" Vundle {
	set nocompatible
	filetype off

	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'scrooloose/nerdtree.git'
	Plugin 'kien/ctrlp.vim'
	Plugin 'jonathanfilip/vim-lucius'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'dkprice/vim-easygrep'
	Plugin 'tpope/vim-surround'
	Plugin 'bling/vim-airline'
	Plugin 'yegappan/mru'

	" SnipMate
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'garbas/vim-snipmate'
	Plugin 'honza/vim-snippets'

	Plugin 'ervandew/supertab'

	" PHP
	Plugin 'evidens/vim-twig'
	Plugin 'docteurklein/php-getter-setter.vim'
	Plugin 'vexxor/phpdoc.vim'

	" HTML
	Plugin 'tmhedberg/matchit'

	call vundle#end() 
" } 

" Generic Settings {
	syntax on
	filetype plugin indent on

	set hidden
	set nobackup
	set noswapfile
	set number
	set autoindent
	set smartindent                                    
	set smarttab
	set mouse=a
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set nowrap
	set encoding=utf-8 
	set history=1000
	set undolevels=1000
	set backspace=indent,eol,start
	set hlsearch

	colorscheme lucius
	LuciusDark

	set guifont=Menlo:h12 

	au BufRead,BufNewFile *.html.twig set filetype=twig
	au BufRead,BufNewFile *.html.twig set syntax=HTML
" }

" Autocomplete {
	"autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
	"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }


" Syntastic {
	let g:syntastic_php_checkers = ['php']
" }

" Taglist {
	let tlist_php_settings='php;f:function'
	let Tlist_GainFocus_On_ToggleOpen = 1
	let Tlist_Exit_OnlyWindow = 1
	let Tlist_Use_Right_Window = 1
	let Tlist_Sort_Type = "name"
" }

" SnipMate {
	let g:snips_author='Alex Raventos <araventos@veo.tv>'
" }

" CtrlP {
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/data/*,*/vendor/*,*/tags
" }

" Airline {
    let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
" }

" EasyGrep {
    let g:EasyGrepMode = 2
	let g:EasyGrepRecursive = 1
	let g:EasyGrepCommand = 1
	let g:EasyGrepFilesToExclude="*.svn\*,*.git\*,.metadata\*,data\*"
	let g:EasyGrepFileAssociations = "/Users/alrav/.vim/custom/EasyGrepFileAssociations" 
	let g:EasyGrepJumpToMatch = 0
" }

" NERDTree {
	let NERDTreeShowHidden=1
	let NERDTreeShowBookmarks=1
" }


" Mappings {
	let mapleader=","

	nnoremap <leader>n :NERDTreeToggle<CR>

	nmap <leader>f :CtrlP<CR><c-d>
	nmap <leader>b :CtrlPBuffer<CR><c-d>

	nmap <leader>o :TlistToggle<CR>
	nmap <leader>m :MRU<CR>
	noremap <Leader>s :update<CR>

	" Switching Splits"
	nmap <C-j> <C-w>j
	nmap <C-k> <C-w>k
	nmap <C-h> <C-w>h
	nmap <C-l> <C-w>l

	" Automatically create closing bracket with indentation
	inoremap {<CR> {<CR>}<C-o>O

	" Use buffers like tabs as they were intended
	nmap gt :bnext<CR>
	nmap g<S-t> :bprevious<CR>
	nmap <leader>6 <c-^>

	" Auto close HTML tags 
	:iabbrev </ </<C-X><C-O>

	" Always paste last yank
	xnoremap p pgvy

	" PHP Documentor
	noremap <leader>pd :call PhpDoc()<CR>

	" 'Split' a line that is joined (e.g., with Shift-J)
	nnoremap K i<CR><Esc>
	
	" Clean close a file (so that the current split window is not closed 
	map fq <Esc>:call CleanClose(0)<CR>

	function! CleanClose(tosave)
		if (a:tosave == 1)
			w!
		endif
		let todelbufNr = bufnr("%")
		let newbufNr = bufnr("#")
		if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
			exe "b".newbufNr
		else
			bnext
		endif

		if (bufnr("%") == todelbufNr)
			new
		endif
		exe "bd".todelbufNr
	endfunction
" }

