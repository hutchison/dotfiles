setlocal textwidth=78

execute "%s,^>\\s*,> "
execute "0"
execute "/^$"
