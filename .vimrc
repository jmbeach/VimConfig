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
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdtree'
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-commentary'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'dylon/vim-antlr'
Plugin 'agilecreativity/vim_printer'
Plugin 'christoomey/vim-system-copy'
Plugin 'alpaca-tc/beautify.vim'
Plugin 'mattn/jscomplete-vim'
Plugin 'AlessandroYorba/Sierra'
Plugin 'breuckelen/vim-resize'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

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

set tabstop=4
set shiftwidth=4
set softtabstop=4
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
let g:sierra_Campfire = 1
colorscheme sierra
let g:vim_resize_disable_auto_mappings = 1
map <s-h> :CmdResizeLeft<cr>
map <s-up> :CmdResizeDown<cr>
map <s-k> :CmdResizeUp<cr>
map <s-l> :CmdResizeRight<cr>
