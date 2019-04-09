#!/bin/bash
echo "" > yellow_paper.md
cd sections
for f in `ls *.md`; do
   echo "" >> ../yellow_paper.md
   cat 00_Preamble >> ../yellow_paper.md
   yaml=`echo $f | cut -d'.' -f 1`
   #echo "carregando ${yaml}"
   python chapter_heading.py "${yaml}.yaml" >> ../yellow_paper.md
   echo "" >> ../yellow_paper.md
   cat $f >> ../yellow_paper.md
   echo "" >> ../yellow_paper.md
   echo "&nbsp; \newpage" >> ../yellow_paper.md
done
cd ..
cp -r sections/images .
