all: merge_sections
	rm -f graphviz-images/*
	pandoc -F pandoc-crossref -F ./graphviz.py -F ./comments.py --pdf-engine=xelatex doc-base/metadata.yaml --template=doc-base/template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H doc-base/yellowpaperstyle.pandoc yellow_paper.md --toc -o build/yellow_paper.pdf --bibliography doc-base/references.bib
	(cd graphviz-images && mogrify -format jpg *.pdf)
	cp -r graphviz-images sections/
#	pandoc --pdf-engine=xelatex metadata.yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H yellowpaperstyle.pandoc yellow_paper.md -V documentclass:amsart --toc -V lot:true -V lof:true -o yellow_paper.pdf
#	pandoc --pdf-engine=xelatex metadata.yaml --template=template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H yellowpaperstyle.pandoc yellow_paper.md -V documentclass:amsart -o yellow_paper.pdf
#	pandoc --pdf-engine=xelatex metadata.yaml -H yellowpaperstyle.pandoc  MANUAL.md -o manual.pdf
#	pandoc -H yellowpaperstyle.pandoc MANUAL.md -o manual.pdf

debian_install:
	apt install pandoc texlive-latex-base texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra texlive-xetex
	# if pandoc is less than 2.0 (some repos has 1.6 version), try to upgrade pandoc version
	wget https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb
	# install github amd64 version for pandoc 2.6 (debian-based)
	dpkg -i pandoc-2.6-1-amd64.deb
	# install pandoc-crossref
	wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.0c/linux-pandoc_2_6.tar.gz
	tar -zxvf linux-pandoc_2_6.tar.gz
	mv pandoc-crossref /usr/bin/
	mv pandoc-crossref.1 /usr/share/man/man1/
	mandb
	# install imagemagick (for mogrify package)
	apt install imagemagick
	# install graphviz filter
	## (depends on haskell cabal)
	##apt install cabal-install graphviz
	##cabal update
	## (depends on python)
	apt install graphviz libgraphviz-dev python python-pip
	pip install pygraphviz
	pip install pandocfilters
	# wget https://raw.githubusercontent.com/jgm/pandocfilters/master/examples/graphviz.py # (already done!)
	# wget https://raw.githubusercontent.com/jgm/pandocfilters/master/examples/comments.py # (already done!)

section: merge_sections
	echo building yellow paper section $(SECTION)
	[ -f sections/$(SECTION).md ] && pandoc -F pandoc-crossref -F ./graphviz.py -F ./comments.py --pdf-engine=xelatex sections/$(SECTION).yaml --template=doc-base/template.tex -M date="`LC_ALL=en_US date "+%B %e, %Y"`" -H doc-base/yellowpaperstyle.pandoc sections/$(SECTION).md --toc -o build/$(SECTION).pdf --bibliography doc-base/references.bib || echo "Section not found"

merge_sections:
	./merge_sections.sh
	# this command is also useful to move images from sections/ to root/ (which is blacklisted on .gitignore to avoid duplicates)

clean:
	rm -f yellow_paper.pdf
