FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y pandoc texlive-latex-base texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra texlive-xetex
# if pandoc is less than 2.0 (some repos has 1.6 version), try to upgrade pandoc version
RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb && dpkg -i pandoc-2.6-1-amd64.deb
# install pandoc-crossref
RUN wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.0c/linux-pandoc_2_6.tar.gz && tar -zxvf linux-pandoc_2_6.tar.gz && mv pandoc-crossref /usr/bin/
#mv pandoc-crossref.1 /usr/share/man/man1/
#mandb
# install imagemagick (for mogrify package)
RUN apt-get install -y  imagemagick
# install graphviz filter
## (depends on haskell cabal)
##apt install cabal-install graphviz
##cabal update
## (depends on python)
RUN apt-get install -y graphviz libgraphviz-dev python python-pip
RUN pip install pygraphviz
RUN pip install pandocfilters
# wget https://raw.githubusercontent.com/jgm/pandocfilters/master/examples/graphviz.py # (already done!)
# wget https://raw.githubusercontent.com/jgm/pandocfilters/master/examples/comments.py # (already done!)

RUN apt-get install -y texlive-fonts-extra
RUN apt-get install -y git

#patch imagemagick
RUN sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' /etc/ImageMagick-6/policy.xml


COPY graphviz.py /graphviz.py
COPY comments.py /comments.py
COPY makefile /makefile
COPY merge_sections.sh /merge_sections.sh

CMD /bin/bash
