setlocal textwidth=78

execute "%s,^>\\s*,> "
execute "0"
execute "/^$"

function AbookQuery()
    let l:querystring = input('? ')
    let l:output = system('abq.sh ' . l:querystring)
    execute 'normal i ' . l:output
endfunction

nmap <silent> <leader>a :call AbookQuery()<CR>
imap <silent> <leader>a <ESC>:call AbookQuery()<CR>
