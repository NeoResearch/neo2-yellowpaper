#!/bin/bash
docker run --rm --mount src="$(pwd)/sections",target=/sections,type=bind --mount src="$(pwd)/doc-base",target=/doc-base,type=bind --mount src="$(pwd)/build",target=/build,type=bind -it pandoc-tex   make

# to build section:
# make section SECTION=08_dBFT
