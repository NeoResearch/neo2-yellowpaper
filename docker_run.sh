#!/bin/bash
function usage {
    echo "Usage: $0 [--section <SECTION_NAME>]"
}

SECTION_NAME="nosection"
DISABLE_SECTION=1

while [[ "$#" > 0 ]]; do case $1 in
    -h)
        usage
        exit 0
        ;;
    --section)
        # Custom neo-cli zip filename
        SECTION_NAME=$2
	DISABLE_SECTION=0
        shift; shift;
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done

if (($DISABLE_SECTION)); then
		echo "BUILDING all chapters. Complete Yellow_Paper.pdf";
		docker run --rm --mount src="$(pwd)/sections",target=/sections,type=bind --mount src="$(pwd)/doc-base",target=/doc-base,type=bind --mount src="$(pwd)/.git",target=/.git,type=bind --mount src="$(pwd)/build",target=/build,type=bind -it pandoc-tex   make
	else
		echo "BUILDING specific chapter $SECTION_NAME";
		docker run --rm --mount src="$(pwd)/sections",target=/sections,type=bind --mount src="$(pwd)/doc-base",target=/doc-base,type=bind --mount src="$(pwd)/.git",target=/.git,type=bind --mount src="$(pwd)/build",target=/build,type=bind -it pandoc-tex   make section SECTION=$SECTION_NAME
fi
