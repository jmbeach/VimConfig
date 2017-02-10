set nocompatible              " be iMproved, required
filetype off                  " required

" ------------------- Vundle ------------------------
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'suan/vim-instant-markdown'
" Uncomment this on initial install
"Plugin 'valloric/youcompleteme'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/Scheme-Mode'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-commentary'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'dylon/vim-antlr'
Plugin 'agilecreativity/vim_printer'
Plugin 'christoomey/vim-system-copy'
Plugin 'mattn/jscomplete-vim'
Plugin 'AlessandroYorba/Sierra'
Plugin 'breuckelen/vim-resize'
Plugin 'mkitt/browser-refresh.vim'
Plugin 'tpope/vim-dispatch.git'
Plugin 'digitaltoad/vim-pug'
Plugin 'tpope/vim-jdaddy'
Plugin 'michalliu/jsruntime.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'johnbradley/vim-fix-xml'
Plugin 'jmbeach/sql-caps.vim'
" enable youcompleteme only for specific filetypes
" Comment this on initial install
autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
autocmd FileType markdown Bundle 'Valloric/YouCompleteMe'
autocmd FileType python Bundle 'Valloric/YouCompleteMe'
autocmd FileType css Bundle 'Valloric/YouCompleteMe'
autocmd FileType jade Bundle 'Valloric/YouCompleteMe'
autocmd FileType html Bundle 'Valloric/YouCompleteMe'
autocmd FileType make Bundle 'Valloric/YouCompleteMe'
autocmd FileType ps1 Bundle 'Valloric/YouCompleteMe'
autocmd FileType javascript Bundle 'Valloric/YouCompleteMe'
autocmd FileType js Bundle 'Valloric/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----------------------------------------------------------------



" ---------------- Color Schemes --------------------

" colorscheme brogrammer



" ---------------- General Settings -----------------

" Turn on syntax hilighting
syntax on
" Turn on line numbers
set number
" Ignore case when searching
set ignorecase

" Don't autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" --------------- Vim Resize Settings -------------

" Don't take auto-resizes default settings
let g:vim_resize_disable_auto_mappings = 1



" --------------- Tab Settings --------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype scheme setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype sql setlocal ts=4

" -------------- Font Settings --------------------

set guifont=Consolas:h11:cANSI


" -------------- Key Mapping ----------------------

" Show/hide nerd tree on ctrl + n
map <C-n> :NERDTreeToggle<CR>
" Beautify javascript on ctrl + f
map <c-f> :call JsBeautify()<cr>
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
autocmd Filetype markdown :setlocal spell spelllang=en_us
" Map ctrl + s to save
map <c-s> :w<cr>

" ## Vim Resize Mappings

" Shift + vim direction resizes window
map <s-left> :CmdResizeLeft<cr>
map <s-down> :CmdResizeDown<cr>
map <s-up> :CmdResizeUp<cr>
map <s-right> :CmdResizeRight<cr>



" Beautify with ctrl + b in specific file-types
autocmd FileType javascript map <buffer> <c-b> :Beautify js-beautify<cr>
autocmd FileType html map <buffer> <c-b> :Beautify html-beautify<cr>
autocmd FileType css map <buffer> <c-b> :Beautify css-beautify<cr>Î

" Switching windows with shift and arrow
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" -------------- Functions -----------------------

function SetEncodingUTF16LittleEndian()
	:e ++enc=utf16le
endfunction

function SetEncodingUTF8()
	:e ++enc=utf8
	:set encoding=utf-8
endfunction


function FixXML()
  "save and run xmllint on our file saving output
  let tempfile = tempname()
  exec "sav! " . tempfile
  let outfile = tempname()
	let command = "C:\\cygwin\\bin\\xmllint.exe --format " . tempfile . " > " . outfile . " && C:\\cygwin\\bin\\echo.exe -n %errorlevel%"
  let result = system(command)
	echo result
  if result == "0" 
		"delete everything
		1,$delete
		"replace it with the result of xmllint
		exec "read ++edit" . outfile
		"delete the blank line at the top
		1,1delete
		redraw!
  else
		let clean_result = substitute(result, tempfile, "Error", 'g')
		echo clean_result
  endif
endfunction

" -------------- Aliases ------------------------

" format xml
:command FX :call FixXML()
