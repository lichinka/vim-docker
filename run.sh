#!/bin/bash

SRC_FILE="$1"
MNT_PNT="/home/dev/src"

get_realpath()
{
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

#
# open the file explorer if nothing was given
#
if [ -z "${SRC_FILE}" ]; then
    MNT_DIR="$( pwd )"
    TGT_FILE="."
#
# full paths should be mounted directly
#
elif [[ ${SRC_FILE} == "/"* ]]; then
    MNT_DIR="$( dirname ${SRC_FILE} )"
    TGT_FILE="${MNT_PNT}/$( basename ${SRC_FILE} )"
#
# or just the current directory
#
elif [ -z "${MNT_DIR}" ] && [ -z "${TGT_FILE}" ]; then
    MNT_DIR="$( pwd )"
    TGT_FILE="${MNT_PNT}/${SRC_FILE}"
fi

echo "Opening file '${SRC_FILE}' as '${TGT_FILE}'"
docker run --rm=true                   \
           -it                         \
           --env HOST_UID=$( id -u )   \
           --env HOST_GID=$( id -g )   \
           -v ${MNT_DIR}:${MNT_PNT}    \
           lichinka/vim-docker:latest  \
           vim ${TGT_FILE}
