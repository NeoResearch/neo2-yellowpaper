all: merge_sections
	pandoc --pdf-engine=xelatex metadata.yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H greenpaperstyle.pandoc green_paper.md --toc -o green_paper.pdf
#	pandoc --pdf-engine=xelatex metadata.yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H greenpaperstyle.pandoc green_paper.md -V documentclass:amsart --toc -V lot:true -V lof:true -o green_paper.pdf
#	pandoc --pdf-engine=xelatex metadata.yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H greenpaperstyle.pandoc green_paper.md -V documentclass:amsart -o green_paper.pdf
#	pandoc --pdf-engine=xelatex metadata.yaml -H greenpaperstyle.pandoc  MANUAL.md -o manual.pdf
#	pandoc -H greenpaperstyle.pandoc MANUAL.md -o manual.pdf

install:
	apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra texlive-xetex

section:
	echo building green paper section $(SECTION)
	[ -f sections/$(SECTION).md ] && pandoc --pdf-engine=xelatex sections/$(SECTION).yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H greenpaperstyle.pandoc sections/$(SECTION).md --toc -o $(SECTION).pdf || echo "Section not found"

merge_sections:
	./merge_sections.sh

clean:
	rm -f green_paper.pdf
