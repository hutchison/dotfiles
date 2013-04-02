BEGIN {
    FS = ":| "
    ORS = ""
}

/^\s*Mon|Tue|Wed|Thu|Fri/ {
    system("date -d '" $6 " " $7 " " $8 "' +'%d. %B'")
    print " & " $11 ":" $12 " Uhr & " $15 ":" $16 " Uhr & "
    if ($19)
        print $19 ":" $20 "\\\\"
    else
        print $20 ":" $21 "\\\\"
    print "\n"
}

/^[[:space:]]*[[:digit:]]+:[[:digit:]]+:[[:digit:]]+ - / {
    print " & " $24 ":" $25 " Uhr & " $28 ":" $29 " Uhr & " $33 ":" $34 "\\\\\n"
}

/^[[:space:]]*Total/ {
    print "\\midrule\n"
    print " & & & " $40 ":" $41 "\\\\\n"
}
