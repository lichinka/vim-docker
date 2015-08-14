#!/bin/bash

MNT_DIR="$( pwd )"
MNT_PNT="/home/dev/src"

#
# try to mount a Git repository root if no parameter were given
#
if [ ! -d ".git" ]; then
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        MNT_DIR="$( git rev-parse --git-dir )"
    fi
fi

echo "Mounting directory '${MNT_DIR}' under '${MNT_PNT}'"
docker run --rm                      \
           -it                       \
           --env HOST_UID=$( id -u ) \
           -v ${MNT_DIR}:${MNT_PNT}  \
           vim-devel:latest          \
           vim $@
