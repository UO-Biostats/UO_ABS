#!/bin/sh
# from kevin thornton

USAGE="
    $0 (input html) (output pdf)
"

if [ $# -lt 2 ]
then
    echo "$USAGE"
    exit 1
fi

HTML_INFILE="$1"
PDF_OUTFILE="$2"

# wait for mathjax to load: https://stackoverflow.com/questions/61914997/how-to-set-headless-chrome-wait-until-the-page-is-fully-loaded-before-printing
# and, use the reveal.js print-to-pdf version: https://revealjs.com/pdf-export/
echo "chromium --headless --disable-gpu --run-all-compositor-stages-before-draw --virtual-time-budget=10000 --print-to-pdf=$PDF_OUTFILE file:///$(pwd)/${HTML_INFILE}?print-pdf"
chromium --headless --disable-gpu --run-all-compositor-stages-before-draw --virtual-time-budget=10000 --print-to-pdf=$PDF_OUTFILE file:///$(pwd)/${HTML_INFILE}?print-pdf

NPAGES=$(exiftool -T -PageCount $PDF_OUTFILE)

PDFJAM_ARG=""

for i in $(seq 1 ${NPAGES}); do
  PDFJAM_ARG="${PDFJAM_ARG} $PDF_OUTFILE $i blank.pdf 1 ";
done


pdfjam -o $PDF_OUTFILE --fitpaper true ${PDFJAM_ARG}

pdfjam -o $PDF_OUTFILE --nup 2x3 --frame true --noautoscale false   --delta "0.2cm 0.3cm" --scale 0.95 $PDF_OUTFILE


