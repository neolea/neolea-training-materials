#!/bin/bash
#

slidedecks=("e.001-introduction" "e.100-information-sharing" "e.200-dfir-pdf-analysis" "e.201-digital-forensic-primer" "e.202-network-forensic" "e.300-data-mining" "e.301-cryptography")
mkdir output
export TEXINPUTS=::`pwd`/themes/
echo ${TEXINPUTS}
for slide in ${slidedecks[@]}; do
        cd ${slide}
        pdflatex main.tex
        pdflatex main.tex
        rm *.aux *.toc *.snm *.log *.out *.nav *.vrb
        cp main.pdf ../output/${slide}.pdf
        rm slide.pdf
        cd ..
done

echo "Generating handout..."
cd output
for pdf in ${slidedecks[@]}; do
        listofpdf+="${pdf}.pdf "
done
echo ${listofpdf}

pdfunite ${listofpdf} neolea-training.pdf
cd ..

exiftool -overwrite_original_in_place -Title="neolea Training and Slide Decks" -Author="CIRCL Computer Incident Response Center Luxembourg" -Subject="neolea" -Keywords="dfir training cybersecurity MISPProject LEA MISP cryptography" ./output/neolea-training.pdf

rm table.md

echo "| Slides (PDF) | Source Code |">>table.md
echo "| ------------ | ----------- |">>table.md

for t in ${slidedecks[@]}; do
        namefile=`echo $t | cut -d: -f1`
        echo "| [${t}](https://github.com/neolea/neolea-training-materials/output/tree/master/${namefile}.pdf) | [source](https://github.com/neolea/neolea-training-materials/tree/master/${t}) |" >>table.md
done

