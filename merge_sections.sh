#!/bin/bash
echo "" > green_paper.md
cd sections
for f in `ls *.md`; do
   echo "" >> ../green_paper.md
   cat $f >> ../green_paper.md
   echo "" >> ../green_paper.md
   echo "&nbsp; \newpage" >> ../green_paper.md
done
cd ..
