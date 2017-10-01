" --------------------------------------------------
" --------------------------------------------------
" File: _vimrc
" Author: Jared Beach
" Description: My vimrc
" Last Modified: July 08, 2017
" --------------------------------------------------
" --------------------------------------------------



" ==================================================
"  Vundle Config
" ==================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --------------------
"  General Plugins
" --------------------

" a snippet engine
Plugin 'SirVer/ultisnips'
" snippets for vim
Plugin 'honza/vim-snippets'
" nav bar for vim
Plugin 'scrooloose/nerdtree'
" Open links in browser
Plugin 'tyru/open-browser.vim'
" Useful commands for resizing windows
Plugin 'breuckelen/vim-resize'
" Vim linting engine
Plugin 'jmbeach/syntastic'
" scrollbar in statusline
Plugin 'gcavallanti/vim-noscrollbar'
" Show soft tabs
Plugin 'Yggdroot/indentLine'
" better markdown support in vim
Plugin 'reedes/vim-pencil'
"Allow vim to call executables
Plugin 'tpope/vim-dispatch'

" --------------------
"  C# Plugins
" --------------------

" C# IDE like functions for VIM
Plugin 'OmniSharp/omnisharp-vim'

" --------------------
"  Powershell Plugins
" --------------------

" Syntax support
Plugin 'PProvost/vim-ps1'

" --------------------
"  SQL Plugins
" --------------------

Plugin 'jmbeach/sql-caps.vim'

" --------------------
"  Themes Plugins
" --------------------

" A dark background with turquoise, red, and peach accents
Plugin 'AlessandroYorba/Sierra'
" Think cherryblossoms
Plugin 'jmbeach/vim-colors-cherryblossom'
" Colorful light background
Plugin 'nightsense/seabird'
" No-nonsense color scheme
Plugin 'jakwings/vim-colors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==================================================
"  General Region
" ==================================================

" Turn on syntax hilighting
syntax on
" Turn on line numbers
set number
" Ignore case when searching
set ignorecase
" Don't autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Enable folding based on the language syntax file
" set foldmethod=syntax

" ==================================================
"  Key Mapping Region
" ==================================================

" Map ctrl + s to save
map <c-s> :w<cr>
" Switching windows with shift and arrow
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" Toggle paste with F10
set pastetoggle=<F10>

" ==================================================
"  gVim Region
" ==================================================

set guifont=Consolas:h11:cANSI

" ==================================================
"  Tabs Region
" ==================================================

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
autocmd Filetype py setlocal ts=4 sts=4 sw=4 tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype tcl setlocal expandtab
autocmd Filetype sd setlocal expandtab

" ==================================================
"  Xterm Region
" ==================================================

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

	" Choose colorscheme / theme
	set background=light
	"colorscheme sierra
	"colorscheme cherryblossom
	"colorscheme seagull
	colorscheme garden

	" colorscheme vim-wwdc17-theme
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
	" set mouse-=a
endif

" ==================================================
"  Language-Specific Region
" ==================================================

" --------------------
"  C#
" --------------------

autocmd Filetype cs inoremap <Char-0x07F> <BS>
autocmd Filetype cs	nnoremap <Char-0x07F> <BS>

" ==================================================
"  Plugin-Specific Region
" ==================================================

" --------------------
"  UltiSnips
" --------------------

let g:UltiSnipsExpandTrigger="<NUL>"
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set rtp+=$HOME/vimfiles/bundle/vim-snippets

" --------------------
"  Nerd Tree
" --------------------

map <C-n> :NERDTreeToggle<CR>

" --------------------
"  Vim Re-size
" --------------------

" Don't take auto-resizes default settings
let g:vim_resize_disable_auto_mappings = 1
" Shift + vim direction resizes window
map <s-left> :CmdResizeLeft<cr>
map <s-down> :CmdResizeDown<cr>
map <s-up> :CmdResizeUp<cr>
map <s-right> :CmdResizeRight<cr>

" --------------------
"  Syntastic
" --------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
" C# OmniSharp syntax checker
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues', 'csharplint']
let g:syntastic_cs_csharplint_exec = 'C:\Program Files (x86)\CSharpLint\CSharpLint.exe'
let g:syntastic_sql_checkers = ['tsqllint']
let g:syntastic_py_checkers = ['pylint']
"let g:syntastic_tcl_nagelfar_exec='tclsh c:/tcl/nagelfar.tcl'
let g:syntastic_tcl_checkers = ['nagelfar']
" Un-comment to get debug messages for syntastic
"let g:syntastic_debug = 3


" --------------------
"  OmniSharp
" --------------------

augroup omnisharp_commands
    autocmd!

		" move preview window to bottom of screen so it doesn't move code
		set splitbelow

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    " autocmd TextChanged *.cs SyntasticCheck

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
    autocmd FileType cs nnoremap <leader>rr :OmniSharpRename<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

		let g:OmniSharp_typeLookupInPreview=1
		let g:omnicomplete_fetch_documentation=1

augroup END

set updatetime=1000

" --------------------
"  Vim-Pencil
" --------------------

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" --------------------
"  Scrollbar
" --------------------

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}
" display statusline always
:set laststatus=2


" --------------------
"  Custom functions
" --------------------

function SetEncodingUTF16LittleEndian()
	:e ++enc=utf16le
endfunction

function SetEncodingUTF8()
	:e ++enc=utf8
	:set encoding=utf-8
endfunction
