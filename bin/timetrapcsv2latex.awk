BEGIN {
	FS = "\"|,|:| "
	m = 0
	h = 0
	gestern = ""
}

function gcd(p, q)
{
	return (q ? gcd(q, (p % q)) : p)
}

/^"/ {
	heute = $2
	if (gestern != heute) {
		printf "%s ", heute
	}
	h_diff = $9 - $3
	m_diff = $10 - $4
	if (m_diff < 0) {
		m_diff += 60
		h_diff -= 1
	}
	g = gcd(m_diff, 60)
	print "& " $3 ":" $4 " Uhr "
	print "& " $9 ":" $10 " Uhr "
	if (m_diff > 0) {
		print "& $" h_diff "\\,\\sfrac{" m_diff/g "}{" 60/g "}$ h"
	} else {
		print "& " h_diff " h"
	}
	print "\\\\"

	h += h_diff
	m += m_diff

	gestern = heute
}

END {
	h += int(m/60)
	m %= 60
	print "\\midrule\n"
	if (m < 10) {
		print "& & & " h ":0" m " h\\\\\n"
	} else {
		print "& & & " h ":" m " h\\\\\n"
	}
}
