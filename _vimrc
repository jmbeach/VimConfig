" File: _vimrc
" Author: Jared Beach
" Description: My vimrc
" Last Modified: June 30, 2017

set nocompatible              " be iMproved, required
filetype off                  " required

" --------------------------------------------------- Vundle ---------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
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
Plugin 'breuckelen/vim-resize'
Plugin 'mkitt/browser-refresh.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'digitaltoad/vim-pug'
Plugin 'tpope/vim-jdaddy'
Plugin 'michalliu/jsruntime.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'johnbradley/vim-fix-xml'
Plugin 'mattn/webapi-vim'
Plugin 'cd01/poshcomplete-vim'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-syntastic/syntastic'
" scrollbar
Plugin 'gcavallanti/vim-noscrollbar'
" Show soft tabs
Plugin 'Yggdroot/indentLine'
" C# IDE like functions for VIM
Plugin 'OmniSharp/omnisharp-vim'
" better markdown support in vim
Plugin 'reedes/vim-pencil'
" TOC generator for markdown files
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'suan/vim-instant-markdown'
" Makes docs show up nicely
Plugin 'Shougo/echodoc.vim'
" Required for code snippets from Omnisharp
"  a snippet engine
Plugin 'SirVer/ultisnips'
" snippets for vim
Plugin 'honza/vim-snippets'
" Paste into md
Plugin 'andrew749/vim-bufpaste'

" capitalizes SQL keywords
Plugin 'jmbeach/sql-caps.vim'

" ----------------------------------------------- Themes ------------------------------------------------
Plugin 'vim-scripts/mayansmoke'
Plugin 'AlessandroYorba/Sierra'
Plugin 'lifepillar/vim-wwdc17-theme'
" XML folds
" Plugin 'vim-scripts/XML-Folding'
" enable youcompleteme only for specific filetypes
" Comment this on initial install
autocmd FileType c++ Bundle 'Valloric/YouCompleteMe'
autocmd FileType markdown Bundle 'Valloric/YouCompleteMe'
autocmd FileType python Bundle 'Valloric/YouCompleteMe'
autocmd FileType css Bundle 'Valloric/YouCompleteMe'
autocmd FileType jade Bundle 'Valloric/YouCompleteMe'
autocmd FileType html Bundle 'Valloric/YouCompleteMe'
autocmd FileType make Bundle 'Valloric/YouCompleteMe'
autocmd FileType javascript Bundle 'Valloric/YouCompleteMe'
autocmd FileType js Bundle 'Valloric/YouCompleteMe'
autocmd FileType cs Bundle 'Valloric/YouCompleteMe'
if !exists('g:PoshComplete_Port')
    let g:PoshComplete_Port = '1234'
endif
autocmd FileType ps1 setlocal omnifunc=poshcomplete#CompleteCommand

autocmd FileType ps1 :call poshcomplete#StartServer()


" All of your Plugins must be added before the following line
call vundle#end()            " required

call plug#begin()
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
call plug#end()
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

" -------------- Configure Mouse -------------------

" scroll wheel
if !has("gui_running")
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
	"set mouse=a
	set nocompatible
	inoremap <Esc>[62~ <C-X>4<C-E>
	inoremap <Esc>[63~ <C-X>4<C-Y>
	nnoremap <Esc>[62~ 4<C-E>
	nnoremap <Esc>[63~ 4<C-Y>
	" colorscheme mayansmoke
	colorscheme sierra
	" colorscheme vim-wwdc17-theme
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
	" set mouse-=a
endif



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
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype sql setlocal ts=4
autocmd Filetype cs setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cs inoremap <Char-0x07F> <BS>
autocmd Filetype cs	nnoremap <Char-0x07F> <BS>
autocmd Filetype py setlocal ts=4 sts=4 sw=4 tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype tcl setlocal expandtab
autocmd Filetype sd setlocal expandtab

" -------------- Font Settings --------------------

set guifont=Consolas:h11:cANSI


" -------------- Keys Mapping ----------------------

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

" Toggle paste with F10
set pastetoggle=<F10>

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

" -------------- Configure Syntastic ------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" C# OmniSharp syntax checker
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_py_checkers = ['pylint']
"let g:syntastic_tcl_nagelfar_exec='tclsh c:/tcl/nagelfar.tcl'
let g:syntastic_tcl_checkers = ['nagelfar']

" -------------- Configure OmniSharp ------------

augroup omnisharp_commands
    autocmd!

		" move preview window to bottom of screen so it doesn't move code
		set splitbelow

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

		let g:OmniSharp_typeLookupInPreview=1
		let g:omnicomplete_fetch_documentation=1

augroup END

" -------------- Configure Pencil ------------------

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" --------------- Configure Markdown Preview -------

let g:instant_markdown_autostart=0

" --------------- Configure EchoDoc ----------------

set cmdheight=2

" --------------- Configure UltiSnips --------------

let g:UltiSnipsExpandTrigger="<NUL>"

" --------------- TCL -----------------------------
" Treat sd as tcl
au BufRead,BufNewFile *.sd set ft=tcl
autocmd FileType sd set syntax=tcl
autocmd FileType sd set nowrap

" -------------- Increase scroll ------------------
:map <F8> :noremap j 3j <CR> :noremap k 3k <CR>
:map <S-F8> :noremap j j <CR> :noremap k k <CR>

" -------------- Srollbar -------------------------
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}
" display statusline always
:set laststatus=2
 
" ---------------- Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set rtp+=$HOME/vimfiles/bundle/vim-snippets
