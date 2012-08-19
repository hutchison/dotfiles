setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79

setlocal makeprg=python\ %
setlocal keywordprg=pydoc
nmap <F5> :!python2 %<CR>
