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

" clearing uses the current background color
" (damit vim in tmux funktioniert)
set t_ut=
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
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
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

set laststatus=2

set nofoldenable

set linebreak
set autoindent smartindent
set smarttab

"schaltet hlsearch aus
noremap <silent> <return> :nohlsearch<Bar>:echo<CR>

"latex:
let g:tex_flavor='latex'

"make:
nmap <F5> :make<CR>

"coole vsplit maps:
"verschiebt den Mittelbalken nach links bzw. rechts
nmap <leader>- <C-W><
nmap <leader>+ <C-W>>

"buffer movement:
nnoremap <space> :bnext<CR>
nnoremap <backspace> :bprevious<CR>

"Datum einfügen
imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
imap <silent> <C-D><C-F> <C-R>=strftime("[%H:%M] ")<CR>

" zum Tag/Funktionsdef. springen:
nmap <leader>f <C-]>

" nächstes falsch geschriebenes Wort:
nmap <leader>s ]s

" springt zum nächsten Komma und setzt danach eine neue Zeile:
nnoremap L f,a<CR><ESC>w

" vimwiki config:
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]
let g:vimwiki_listsyms = '✗○◐●✓'

""" Syntastic
let g:syntastic_python_checkers = ["flake8", "pyflakes"]

" NERDTree ein-/ausblenden:
nmap <F9> :NERDTreeToggle<CR>

function! FixEmail()
	set ft=mail
	set tw=80

	" mittels vim-better-whitespace:
	StripWhitespace
endfunction

nmap <F8> :call FixEmail()<CR>

function! FixXML()
	set ft=xml
	execute "%!tidy -q -i --show-errors 1 -xml -utf8"
	StripWhitespace
endfunction

nmap <F7> :call FixXML()<CR>
