#!/usr/bin/env bash

set -e

if [[ -z "$2" ]]; then
    JAHR=$(date +%Y)
else
    JAHR=$2
fi
MONAT=$1
MONATSNAME=$(date --date="$JAHR-$MONAT-1" +"%B")

LETZTERTAG=$(cal $MONAT $JAHR | egrep "28|29|30|31" | tail -1 | awk '{print $NF}')

ZEITEN=$(t d -s "1.$MONAT.$JAHR" -e "$LETZTERTAG.$MONAT.$JAHR" | awk -f "$HOME/.local/bin/timetrap2latex.awk")

DATEIPREFIX="$JAHR-$MONAT"
DATEINAME="$DATEIPREFIX.tex"

cat > $DATEINAME << EOF
\documentclass[
a4paper,
11pt,
]
{scrartcl}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{microtype}
\usepackage[ngerman]{babel}
\usepackage{ellipsis}

\usepackage{amssymb}

\usepackage[cm]{fullpage}
\usepackage[
  singlespacing
]{setspace}
\usepackage{booktabs}
\parindent 0pt

\\title{Arbeitszeitnachweis}
\\author{Martin Darmüntzel}
\date{$MONATSNAME $JAHR}

\\begin{document}

\maketitle

\\begin{center}
  \\begin{tabular}{rrrr}
    \\toprule
    \\textbf{Datum} & \multicolumn{1}{c}{\\textbf{von}} &
    \multicolumn{1}{c}{\\textbf{bis}} & \\textbf{Dauer}\\\\
    \midrule
    $ZEITEN
    \\bottomrule
  \\end{tabular}

  \\vspace{3.14159cm}

  \\rule{0.5\\textwidth}{0.5pt}

  Martin Darmüntzel

  \\end{center}

\\end{document}
EOF

pdflatex $DATEINAME > /dev/null

rm "$DATEIPREFIX.log" "$DATEIPREFIX.aux" "$DATEIPREFIX.tex"
