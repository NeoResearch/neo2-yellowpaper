#!/bin/bash
echo "" > green_paper.md
cd sections
for f in `ls`; do
   cat $f >> ../green_paper.md
done
cd ..
