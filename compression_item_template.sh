#!/bin/sh
export IFS=$'\n' ## to allow for spaces in names, ugh...

## set the duration of the slate here (if you need slateless).
export slate_offset=00:00:00
echo $slate_offset;

## set the length of the pieces here.
export time=00:00:15

## Output directory: notice it IS SURROUNDED BY QOUTES and it ENDS WITH A SLASH.
export output_dir="/Users/makinegx15/Desktop/test/"

## FULLL PATH TO Files (One per line) : notice it is ENCLOSED BY DOUBLE QUOTES and it ENDS WITH A SAPCE AND A BACKSLASH.
export files=( \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/C-HR_ART_PIECE_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/C-HR_PURE_STYLE_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/CAMRY_THANK_YOU_BRO_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/COROLLA_SO_MANY_CHOICES_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/RAV4_BIGFOOT_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/RAV4_QUEEN_BEE_1920x1080_FINAL_2017-04-18_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/TUNDRA_SPACE_FOR_EVERYONE_1920x1080_FINAL_2017-04-17_1.mov" \
"/Volumes/pegasus/01_PROJECTS/17041_CATM547_Toyota_In Market_Traffic/07_DI/04_Full_Edits/02_ONL_Edits/042117/YARIS_DONT_TOUCH_IT_1920x1080_FINAL_2017-04-17.mov"
)

for f in ${files[@]}; do mk_conill_6specs.sh "$f"; done
