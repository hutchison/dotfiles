BEGIN {
    FS = ":| "
    ORS = ""
    m = 0
    h = 0
}

/^\s*Mon|Tue|Wed|Thu|Fri/ {
    system("date -d '" $6 " " $7 " " $8 "' +'%d. %B'")
    print " & " $11 ":" $12 " Uhr & " $15 ":" $16 " Uhr & "
    if ($19) {
        print $19 ":" $20 "\\\\"
        h += $19
        m += $20
    } else {
        print $20 ":" $21 "\\\\"
        h += $20
        m += $21
    }
    print "\n"
}

/^[[:space:]]*[[:digit:]]+:[[:digit:]]+:[[:digit:]]+ - / {
    print " & " $24 ":" $25 " Uhr & " $28 ":" $29 " Uhr & " $33 ":" $34 "\\\\\n"
    h += $33
    m += $34
}

/^[[:space:]]*Total/ {
    h += int(m/60)
    m %= 60
    print "\\midrule\n"
    print " & & & " h ":" m "\\\\\n"
}
