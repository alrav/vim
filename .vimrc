" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vundle {
	filetype off

	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" General
	Plugin 'jonathanfilip/vim-lucius'
	Plugin 'vimwiki/vimwiki'

	" IDE
	Plugin 'scrooloose/nerdtree.git'
	Plugin 'kien/ctrlp.vim'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'dkprice/vim-easygrep'
	Plugin 'tpope/vim-surround'
	Plugin 'bling/vim-airline'
	Plugin 'yegappan/mru'
	Plugin 'ervandew/supertab'
	Plugin 'vim-scripts/AutoComplPop'

	" SnipMate
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'garbas/vim-snipmate'
	Plugin 'alrav/vim-snippets'

	" PHP
	Plugin 'evidens/vim-twig'
	Plugin 'docteurklein/php-getter-setter.vim'
	Plugin 'tobyS/vmustache'
	Plugin 'tobyS/pdv'
	Plugin 'arnaud-lb/vim-php-namespace'
	Plugin 'joonty/vim-phpqa'

	" HTML
	Plugin 'tmhedberg/matchit'
	Plugin 'othree/html5.vim'

	" API Blueprint
	Plugin 'kylef/apiblueprint.vim'

	call vundle#end() 
" } 

" Set the mapleader before remapping anything to leader
let mapleader=","

" Plugin Customizations {

	" Supertab {
		autocmd FileType php let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
	" }

	" MRU {
		nmap <leader>m :MRU<CR>
	" }
	
	" Taglist {
		let tlist_php_settings='php;f:function'
		let Tlist_GainFocus_On_ToggleOpen = 1
		let Tlist_Exit_OnlyWindow = 1
		let Tlist_Use_Right_Window = 1
		let Tlist_Sort_Type = "name"
		nmap <leader>o :TlistToggle<CR>
	" }

	" SnipMate {
		let g:snips_author='Alex Raventos <araventos@veo.tv>'
		let g:snipMate_no_default_aliases=1
        :imap <D-Space> <Plug>snipMateNextOrTrigger
        :smap <D-Space> <Plug>snipMateNextOrTrigger

	" }

	" CtrlP {
		set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/tags,*/data/*,*/vendor/*,*/bin/*,*/doc/*,*/node_modules/*
		let g:ctrlp_use_caching = 1
		let g:ctrlp_clear_cache_on_exit = 0
		nmap <leader>f :CtrlP<CR><c-d>
		nmap <leader>b :CtrlPBuffer<CR><c-d>
	" }

	" Airline {
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#fnamemod = ':t'
	" }

	" EasyGrep {
		let g:EasyGrepMode = 2
		let g:EasyGrepRecursive = 1
		let g:EasyGrepCommand = 1
		let g:EasyGrepFilesToExclude="*.svn\*,*.git\*,.metadata\*,data\*,node_modules\*"
		let g:EasyGrepFileAssociations = "/Users/alrav/.vim/custom/EasyGrepFileAssociations" 
		let g:EasyGrepJumpToMatch = 0
	" }

	" NERDTree {
		let NERDTreeShowHidden=1
		let NERDTreeShowBookmarks=1
		nnoremap <leader>n :NERDTreeToggle<CR>
	" }

	" vim-php-namespace {
		nnoremap <leader>u :call PhpInsertUse()<CR>
		inoremap <leader>u <Esc>:call PhpInsertUse()<CR>i
	" }
	
	" Pdv {
		let g:pdv_template_dir = $HOME ."/.vim/custom/pdv/templates/php"
		nnoremap <leader>pd :call pdv#DocumentCurrentLine()<CR>
	" }

	" PHPQA {
		let g:phpqa_messdetector_ruleset = "build/phpmd.xml"	
		let g:phpqa_messdetector_cmd='vendor/bin/phpmd'
		let g:phpqa_messdetector_autorun = 1
		let g:phpqa_codesniffer_autorun = 0
		let g:phpqa_codecoverage_autorun = 0
	" }
	
	" Vimwiki {
		let g:vimwiki_list = [{'path': $HOME .'/Dropbox/vimwiki/'}]
	" }
" }

" General Config {

	" Turn on syntax highlighting
	syntax on

	" This makes vim act like all other editors, buffers can
	" exist in the background without being in a window.
	" http://items.sjbach.com/319/configuring-vim-right
	set hidden

	" Turn off swap files
	set nobackup
	set noswapfile

	" Line numbers
	set number

	" Allow backspace in insert mode
	set backspace=indent,eol,start

	" Indentation
	filetype plugin indent on
	set autoindent
	set smartindent                                    
	set smarttab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4

	" Don't wrap lines
	set nowrap

	" Enable UTF-8
	set encoding=utf-8 
	
	" Long command line history
	set history=1000

	" Long undo levels
	set undolevels=1000

	" Enable highlight search
	set hlsearch
	set diffopt+=vertical
	"set ignorecase
	"set smartcase

	" Reload files changed outside of Vim
	set autoread 

	" Color schemes and Appearance
	colorscheme lucius
	LuciusDark
	set guifont=Menlo:h12 

	" Filetype Aliasing
	au BufRead,BufNewFile *.html.twig set filetype=twig
	au BufRead,BufNewFile *.html.twig set syntax=HTML

	" Convert tabs to spaces for Blueprint
	autocmd FileType apiblueprint setlocal expandtab 

	" Set word wrap on for vimwiki only
	autocmd FileType vimwiki setlocal wrap

	" Autocompletion
		" Close Scratch preview automatically
		autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
		autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" }


"  General Custom Mappings {

	" Switching Splits"
	nmap <C-j> <C-w>j
	nmap <C-k> <C-w>k
	nmap <C-h> <C-w>h
	nmap <C-l> <C-w>l
	
	" Goto left-most, and right-most windows - respectively
	nnoremap <leader>h <C-w>20h
	nnoremap <leader>l <C-w>20l

	" Automatically create closing bracket with indentation
	inoremap {<CR> {<CR>}<C-o>O

	" Switch between buffers like tabs
	nmap gt :bnext<CR>
	nmap g<S-t> :bprevious<CR>
	nmap <leader>6 <c-^>

	" Auto close HTML tags 
	:iabbrev </ </<C-X><C-O>

	" Always paste last yank
	:nnoremap <c-p> p

	" 'Split' a line that is joined (e.g., with Shift-J)
	nnoremap K i<CR><Esc>

	" Clean close a file (so that the current split window is not closed 
	map fq <Esc>:call CleanClose(0)<CR>

	" Search and replace under cursoer
	:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

	" Indent current line
	:nnoremap <Leader><Tab> <S-v>=

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
	
	" Call PHPUnit 
		nnoremap <leader>t :!./vendor/bin/phpunit --configuration test/phpunit.xml<cr>

" }

