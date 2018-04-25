" --------------------------------------------------
" --------------------------------------------------
" File: _vimrc
" Author: Jared Beach
" Description: My vimrc
" Last Modified: April 25, 2018
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
" Show soft tabs
Plugin 'Yggdroot/indentLine'
" better markdown support in vim
Plugin 'reedes/vim-pencil'
"Allow vim to call executables
Plugin 'tpope/vim-dispatch'
" Allow plugins to talk to eachother
Plugin 'Shougo/unite.vim'

" --------------------
"  C# Plugins
" --------------------

" C# IDE like functions for VIM
Plugin 'OmniSharp/omnisharp-vim'
" A million other C# benefits
Plugin 'OrangeT/vim-csharp.git'


" --------------------
"  Python Plugins
" --------------------

" Python completion
Plugin 'davidhalter/jedi'

" --------------------
"  Powershell Plugins
" --------------------

" Syntax support
Plugin 'PProvost/vim-ps1'

" --------------------
"  SQL Plugins
" --------------------

" Capitalize sql keywords
Plugin 'jmbeach/sql-caps.vim'
" SSMS-like capabilities
Plugin 'vim-scripts/dbext.vim'

" --------------------
"  HTML Plugins
" --------------------

" Match html tags (highlight)
Plugin 'Valloric/MatchTagAlways'
" completion
Plugin 'othree/html5.vim'
" auto-close tags
Plugin 'alvan/vim-closetag'
" change surrounding text
Plugin 'tpope/vim-surround'

" --------------------
"  TypeScript Plugins
" --------------------

" syntax and omnicompletion
Plugin 'leafgarland/typescript-vim'
" typescript server
Plugin 'Quramy/tsuquyomi'

" --------------------
"  Vue Plugins
" --------------------

" syntax for vue
Plugin 'posva/vim-vue'

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
" dark, interesting color scheme
Plugin 'Yggdroot/duoduo'
" light no-nonsense
Plugin 'aunsira/macvim-light'
" collection of xterm color
Plugin 'KevinGoodsell/vim-xterm-colors'

" --------------------
"  Writing Plugins
" --------------------

" distraction free writing
Plugin 'junegunn/goyo.vim'
" curly quotes
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-quote'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==================================================
"  General Region
" ==================================================

:set cursorline

" Turn on syntax hilighting
syntax on
" Turn on line numbers
set number
" Ignore case when searching
set ignorecase
" Don't autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" show folds
let g:indentLine_char = '|'
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

if has('gui_running')
	set guifont=Consolas:h11:cANSI
endif

" ==================================================
"  Tabs Region
" ==================================================

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sts=2 sw=2 expandtab
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

	" colorscheme vim-wwdc17-theme
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
	" set mouse-=a
	set encoding=utf-8
endif

" Choose colorscheme / theme
colorscheme desert256

" ==================================================
"  Language-Specific Region
" ==================================================

" --------------------
"  C#
" --------------------

autocmd Filetype cs inoremap <Char-0x07F> <BS>
autocmd Filetype cs	nnoremap <Char-0x07F> <BS>

" --------------------
"  SQL
" --------------------

let g:dbext_default_profile_SequenceEngineLocal = 'type=SQLSRV:user=sa:passwd=Hyla10$:srvname=localhost\v12:dbname=SequenceEngine'
let g:dbext_default_profile_CommunicationManagerLocal = 'type=SQLSRV:user=sa:passwd=Hyla10$:srvname=localhost\v12:dbname=HylaHsConfig'
let g:dbext_default_SQLSRV_cmd_options = '-v SQLCMDMAXFIXEDTYPEWIDTH = "100"'
let g:dbext_default_SQLSRV_bin = 'sqlcmd'

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
let g:syntastic_cs_checkers = ['issues']
"let g:syntastic_cs_checkers = ['csharplint']
let g:syntastic_cs_csharplint_exec = 'C:\Program Files (x86)\CSharpLint\CSharpLint.exe'
let g:syntastic_sql_checkers = ['tsqllint']
let g:syntastic_py_checkers = ['pylint']
"let g:syntastic_tcl_nagelfar_exec='tclsh c:/tcl/nagelfar.tcl'
let g:syntastic_tcl_checkers = ['nagelfar']
" Un-comment to get debug messages for syntastic
"let g:syntastic_debug = 3
let g:syntastic_markdown_checkers = ['proselint']

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
    autocmd BufEnter,BufWrite *.cs SyntasticCheck
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
		let g:OmniSharp_server_type = 'roslyn'
		" makes the documentation window tiny
		set previewheight=5

		let g:Omnisharp_start_server=1
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
"  Custom functions
" --------------------

function SetEncodingUTF16LittleEndian()
	:e ++enc=utf16le
endfunction

function SetEncodingUTF8()
	:e ++enc=utf8
	:set encoding=utf-8
endfunction

" ==================================================
"  Language Configurations
" ==================================================

" --------------------
"  HTML
" --------------------

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.aspx,*.vue'
autocmd FileType aspx.html setlocal expandtab

let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'aspx.html' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'vue' : 1,
        \}

" ==================================================
"  General Vim Helpers
" ==================================================

" --------------------
"  Cycle colors
" --------------------
let s:mycolors = []
let s:mycolors = ['desert256', 'duoduo', 'herald', 'lettuce', 'lucius', 'moody', 'mustang', 'relaxedgreen', 'sierra', 'slate', 'tabula', 'tir_black']
let s:current_color = index(s:mycolors, g:colors_name)

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let s:current_color += how
      if !(0 <= s:current_color && s:current_color < len(s:mycolors))
        let s:current_color = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[s:current_color]
      break
    catch /E185:/
      call add(missing, s:mycolors[s:current_color])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

map <leader>nc :call NextColor(1)<CR>
map <leader>pc :call NextColor(-1)<CR>

" ==================================================
"  Writing Configs
" ==================================================

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
