" Templates:
autocmd BufNewFile *.tex,*.latex    0r ~/.vim/templates/latex
autocmd BufNewFile *.xtex,*.xelatex 0r ~/.vim/templates/xelatex
autocmd BufNewFile *.py             0r ~/.vim/templates/python

autocmd BufRead,BufNewFile *.xtex,*.xelatex setfiletype tex
autocmd BufRead,BufNewFile *.xtex,*.xelatex set makeprg=xelatex\ %

autocmd BufNewFile,BufRead *.ini,*/.hgrc,*/.hg/hgrc setfiletype ini

autocmd BufRead,BufNewFile *.jinja2 setfiletype htmljinja
autocmd BufRead,BufNewFile *.j2 setfiletype jinja

autocmd BufRead,BufNewFile *.muttrc setfiletype muttrc

autocmd BufRead,BufNewFile *.m setfiletype octave
