#!/bin/bash

MNT_DIR="$1"
MNT_PNT="$2"

if [ -z "${MNT_DIR}" ]; then
    MNT_DIR=~/
fi
if [ -z "${MNT_PNT}" ]; then
    MNT_PNT="/home/dev/src"
else
    MNT_PNT="/home/dev/src/${MNT_PNT}"
fi

echo "Mounting directory '${MNT_DIR}' under '${MNT_PNT}'"
docker run -it                       \
	    -v ${MNT_DIR}:${MNT_PNT} \
	    vim-devel:latest
