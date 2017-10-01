set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
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
Plugin 'alpaca-tc/beautify.vim'
Plugin 'vim-scripts/xterm16.vim'
Plugin 'Rykka/clickable.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'akmassey/syntastic_proselint'
Plugin 'johnbradley/vim-fix-xml'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'mxw/vim-jsx'
Plugin 'jmbeach/sql-caps.vim'
Plugin 'reedes/vim-pencil'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'suan/vim-instant-markdown'
Plugin 'Yggdroot/indentLine'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'junegunn/goyo.vim'

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
syntax on
set number
set ignorecase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
map <C-n> :NERDTreeToggle<CR>
" colorscheme brogrammer
map <c-f> :call JsBeautify()<cr>
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype scheme setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
let g:sierra_Campfire = 1
colorscheme sierra
" let xterm16_colormap	= 'softlight'
" let xterm16_brightness	= 'high'
" colorscheme xterm16 
let g:vim_resize_disable_auto_mappings = 1
map ˙ :CmdResizeLeft<cr>
map ∆ :CmdResizeDown<cr>
map ˚ :CmdResizeUp<cr>
map ¬ :CmdResizeRight<cr>
" set listchars+=space:·,tab:>-	
" set list
command! -nargs=1 Silent
			\ | execute ':silent !'.<q-args>
			\ | execute ':redraw!'

map <C-x> :w \| Silent make && chrome-cli reload<cr>
map <C-b> :w \| Silent make open<cr>

" File association
autocmd BufNewFile,BufRead *.scm set syntax=scam
" Don't autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType javascript map <buffer> <c-b> :Beautify js-beautify<cr>
autocmd FileType javascript set tabstop=4
autocmd FileType javascript set shiftwidth=4
autocmd FileType html map <buffer> <c-b> :Beautify html-beautify<cr>
autocmd FileType css map <buffer> <c-b> :Beautify css-beautify<cr>

let g:syntastic_markdown_checkers = ['proselint']
autocmd FileType markdown :Goyo
autocmd FileType markdown let b:syntastic_checkers = ['proselint']
autocmd FileType markdown let g:syntastic_checkers = ['proselint']
autocmd FileType javascript let b:syntastic_checkers = ['eslint']
autocmd FileType javascript let g:syntastic_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
autocmd FileType python let g:syntastic_checkers = ['pylint']
autocmd FileType python let b:syntastic_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint'] "Use eslint for syntax checking
let g:fixmyjs_engine = 'eslint'
" Point syntastic checker at locally installed `eslint` if it exists.
function UseEslint()
	if executable('node_modules/.bin/eslint')
		let b:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
		let g:fixmyjs_executable = 'node_modules/.bin/eslint'
		let g:fixmyjs_rc_path = '.eslintrc'
	endif
endfunction
autocmd FileType javascript call UseEslint()
let g:syntastic_python_checkers = ['pylint']

function FixXML()
  "save and run xmllint on our file saving output
  let tempfile = tempname()
  exec "sav! " . tempfile
  let outfile = tempname()
  let result = system("xmllint --format " . tempfile . ">" . outfile . "; echo -n $?")
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

:command FX :call FixXML()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:jsx_ext_required = 0

" -------------- Configure Vim Pencil ---------------------

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

