#!/bin/bash

set -x

# thesis pdf
thesis="docs/phd-thesis.pdf"

# page number that has the "PAPER 1" title in the thesis (before the UBDs paper)
paper1_page=46
paper2_page=$(($paper1_page+4))
paper3_page=$(($paper2_page+7))

# keep bookmark info from thesis pdf
pdftk docs/phd-thesis.pdf dump_data > thesis.info

# merge pdfs
pdftk T=docs/phd-thesis.pdf A=papers/ubds.pdf B=papers/pubdictionaries.pdf C=papers/emba.pdf D=papers/bias.pdf cat T1-$paper1_page A T$paper2_page B T$paper3_page C T63 D T94 output out.pdf

# retain original outline
pdftk out.pdf update_info thesis.info output out2.pdf

# finish and clean up
mv out2.pdf docs/phd-thesis.pdf
rm out.pdf thesis.info
