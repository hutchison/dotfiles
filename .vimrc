call pathogen#infect()

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

"set clipboard=unnamed

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
"set autochdir

" hab ich noch drin, falls man es mal braucht
"set spell
"set spelllang=de

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

" die richtige Farbwahl:
colorscheme xoria256
set background=light

"if has("gui_running")
"    colorscheme xoria256
"endif
if version >= 703
    set colorcolumn=+1 "die Spalte 'textwidth+1' wird markiert
    hi ColorColumn ctermbg=DarkRed guibg=DarkRed "überschreibt Werte vom colorscheme
endif

set backspace=indent,eol,start

set nostartofline

" von hukl:
set list listchars=tab:»·,trail:·
set shortmess=aOstT
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%=#%n
set laststatus=2

set nofoldenable

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set linebreak
set textwidth=150
set autoindent smartindent
set smarttab

"schaltet hlsearch aus
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"latex:
let g:tex_flavor='latex'
map <leader>t <ESC>:!pdflatex %<CR><CR>
map <leader>z <ESC>:!ps4pdf %<CR><CR>
vmap <leader>b <ESC>`>a}<ESC>`<i\textbf{<ESC>f}

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

"Datum einfügen
nmap <leader>d "=strftime("%Y-%m-%d %H:%M")<CR>p
imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
imap <silent> <C-D><C-F> <C-R>=strftime("[%H:%M] ")<CR>

" Octave Syntax
augroup filetypedetect
    au! BufRead,BufNewFile *.m setfiletype octave
augroup END

" zum Tag/Funktionsdef. springen:
nmap <leader>f <C-]>

" vimwiki config:
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]
