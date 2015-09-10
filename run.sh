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
# relative paths are handled differently
#
elif [ ! -d ".git" ]; then
    git rev-parse --git-dir > /dev/null 2>&1
    #
    # try to mount a Git repository
    #
    if [ $? -eq 0 ]; then
        MNT_DIR="$( git rev-parse --git-dir | sed -e 's/git$//' )"
        MNT_DIR="$( get_realpath "${MNT_DIR}" )"
        MNT_DIR="$( dirname ${MNT_DIR} )"
        TGT_FILE="$( basename ${SRC_FILE} )"
    fi
fi
#
# or just the current directory if everything else fails
#
if [ -z "${MNT_DIR}" ] && [ -z "${TGT_FILE}" ]; then
    #
    # or just the current directory
    #
    MNT_DIR="$( pwd )"
    TGT_FILE="${MNT_PNT}/$( basename ${SRC_FILE} )"
fi

echo "Opening file '${SRC_FILE}' as '${TGT_FILE}'"
docker run --rm                        \
           -it                         \
           --env HOST_UID=$( id -u )   \
           --env HOST_GID=$( id -g )   \
           -v ${MNT_DIR}:${MNT_PNT}    \
           lichinka/vim-docker:latest  \
           vim ${TGT_FILE}
