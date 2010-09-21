set nocompatible

let mapleader=','

set number
set numberwidth=4
set ruler
set scrolloff=5

set encoding=utf-8
set showmode

syntax on
filetype plugin indent on

"set spell
"set spelllang=de

set clipboard=unnamed

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
"set autochdir

set hidden
set mouse=a
set wildmenu
set wildmode=list:longest

set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
" setzt automatisch das g Flag bei Textersetzungen:
set gdefault

colorscheme wombat
set background=light
if has("gui_running")
    colorscheme xoria256
endif

set backspace=indent,eol,start

set nostartofline

set listchars=tab:>-,trail:- " show tabs and trailing 
set list " we do what to show tabs, to ensure we get them out of my files 
set shortmess=aOstT
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set laststatus=2

set nofen

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=8
set linebreak

"schaltet hlsearch aus
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"copy & paste
"kopiert die ganze Zeile: (mac-spezifisch)
"nmap ,c :.w !pbcopy<CR><CR>
"vmap ,c :w !pbcopy<CR><CR>
"nmap ,v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

"latex:
let g:tex_flavor='latex'
map <leader>t <ESC>:!pdflatex %<CR><CR> 
map <leader>z <ESC>:!ps4pdf %<CR><CR> 

"make:
map <leader>m <ESC>:!make<CR><CR>

"haskell<leader> ghci:
map <leader>g <ESC>:!ghci %<CR><CR>

"java
map <leader>j <ESC>:!javac -verbose %<CR>

"gcc
map <leader>b <ESC>:!gcc -Wall <C-R>=expand("%:t")<CR><CR><CR>
map <leader>a <ESC>:!./a.out<CR>

"coole vsplit maps:
"verschiebt den Mittelbalken nach links bzw. rechts
nmap <leader>- <C-W><
nmap <leader>+ <C-W>>

"buffer movement:
nmap <M-right> <ESC>:bnext<CR>
nmap <M-left> <ESC>:bprevious<CR>
nmap <M-l> <ESC>:bnext<CR>
nmap <M-h> <ESC>:bprevious<CR>
nmap <leader>x <ESC>:bnext<CR>
nmap <leader>y <ESC>:bprevious<CR>
