call pathogen#infect()

set rtp+=~/dotfiles/powerline/powerline/bindings/vim

set nocompatible

let mapleader=','

set noerrorbells
set number
set numberwidth=4
set ruler
set scrolloff=5
set cursorline
set relativenumber

set encoding=utf-8
if &modifiable != 0
    set fileencoding=utf-8
endif
set showmode

syntax on
filetype plugin indent on
source $HOME/.vim/filetype.vim

"set clipboard=unnamed

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
set autochdir

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

function! SetSolarizedBackground()
    if strftime("%H") >= 5 && strftime("%H") < 17
        if &background != 'light'
            set background=light
        endif
    else
        if &background != 'dark'
            set background=dark
        endif
    endif
endfunction

" die richtige Farbwahl:
colorscheme default
set background=dark

if &term == "xterm"
    set t_Co=256
    colorscheme wombat
    set background=light
endif

if &term == "xterm-256color"
    colorscheme solarized
    call SetSolarizedBackground()
    if has("autocmd")
        autocmd bufwritepost * call SetSolarizedBackground()
    endif
endif

if has("gui_macvim") || has("gui_running")
    set guioptions=aeirL
    colorscheme solarized
    set autochdir
    call SetSolarizedBackground()
    if has("autocmd")
        autocmd bufwritepost * call SetSolarizedBackground()
    endif
endif

if has("gui_macvim")
    set guifont=Inconsolata:h16
endif

if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 11
endif

" Powerline setup:
let g:Powerline_symbols='fancy'

if version >= 703
    set colorcolumn=+1 "die Spalte 'textwidth+1' wird markiert
    hi ColorColumn ctermbg=DarkRed guibg=DarkRed "überschreibt Werte vom colorscheme
endif

set backspace=indent,eol,start

set nostartofline

" von hukl:
set list listchars=tab:»·,trail:·
set shortmess=aOstT
"set statusline=%f%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%=#%n

" Statusline {{{
function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%3*[%1*%{GetName()}%3*]%3*
set statusline+=%7*%{&modified?'\ (modified)':'\ '}%3*
set statusline+=%5*%{IsHelp()}%3*
set statusline+=%6*%{&readonly?'\ (read-only)\ ':'\ '}%3*
set statusline+=%3*fenc:%4*%{strlen(&fenc)?&fenc:'none'}%3*\ \ 
set statusline+=%3*ff:%4*%{&ff}%3*\ \ 
set statusline+=%3*ft:%4*%{strlen(&ft)?&ft:'<none>'}\ \ 
set statusline+=%3*tab:%4*%{&ts}
set statusline+=%3*,%4*%{&sts}
set statusline+=%3*,%4*%{&sw}
set statusline+=%3*,%4*%{&et?'et':'noet'}\ \ 
"set statusline+=%<%3*pwd:%4*%{getcwd()}\ \ 
"set statusline+=%3*%=
"set statusline+=%3*git:%4*%{GitBranchInfoString()}\ \ 
set statusline+=%3*col:%4*%c\ \ 
set statusline+=%3*line:%4*%l\ \ 
set statusline+=%3*total:%4*%L\ 
" }}}

set laststatus=2

set nofoldenable

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set linebreak
set textwidth=80
set autoindent smartindent
set smarttab

"schaltet hlsearch aus
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"latex:
let g:tex_flavor='latex'

"make:
nmap <F5> :make<CR>

"coole vsplit maps:
"verschiebt den Mittelbalken nach links bzw. rechts
nmap <leader>- <C-W><
nmap <leader>+ <C-W>>

"buffer movement:
nmap <leader>e <ESC>:bnext<CR>
nmap <leader>q <ESC>:bprevious<CR>

"Datum einfügen
imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
imap <silent> <C-D><C-F> <C-R>=strftime("[%H:%M] ")<CR>

" zum Tag/Funktionsdef. springen:
nmap <leader>f <C-]>

" nächstes falsch geschriebenes Wort:
nmap <leader>s ]s

" vimwiki config:
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]
let g:vimwiki_listsyms = '✗○◐●✓'

" NERDTree ein-/ausblenden:
nmap <F9> :NERDTreeToggle<CR>
