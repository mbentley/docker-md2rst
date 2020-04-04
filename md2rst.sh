#!/bin/bash

#set -x

if [ $# != 2 ]; then
    echo "error: $0 requires 2 arguments"
    echo "usage:"
    echo " $(basename "$0") <source dir> <destination dir>"
    exit 1
fi

SRC="$1"
DEST="$2"
export SRC DEST

if [ ! -d "$SRC" ]; then
    echo "error: source '$SRC' is not a directory"
    exit 1
fi

if ! mkdir -p "$DEST"; then
    echo "error: failed to create destination '$DEST'"
    exit 1
fi

convfunc() {
    input="$1"
    inputdir=$(dirname "$input")
    destdir="$DEST/$inputdir"
    mkdir -p "$destdir"
    destfile="$DEST/${input%.md}.rst"
    echo "$input -> $destfile"
    pandoc -o "$destfile" "$input"
}
export -f convfunc

cd "$SRC" || exit

find . -iname '*.md' -print0 | xargs -0 -n1 bash -c 'convfunc "$@"' arg0
echo "Done."
