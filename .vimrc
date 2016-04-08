set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'suan/vim-instant-markdown'
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
let g:vim_resize_disable_auto_mappings = 1
map <s-h> :CmdResizeLeft<cr>
map <s-up> :CmdResizeDown<cr>
map <s-k> :CmdResizeUp<cr>
map <s-l> :CmdResizeRight<cr>
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
autocmd FileType html map <buffer> <c-b> :Beautify html-beautify<cr>
autocmd FileType css map <buffer> <c-b> :Beautify css-beautify<cr>
