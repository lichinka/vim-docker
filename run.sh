#!/bin/bash

MNT_DIR="$1"
MNT_PNT="$2"

#
# get the host IP address
#
DOCKER_HOST_IP="netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'"


if [ -z "${MNT_DIR}" ]; then
    MNT_DIR=~/
fi
if [ -z "${MNT_PNT}" ]; then
    MNT_PNT="/home/dev/src"
else
    MNT_PNT="/home/dev/src/${MNT_PNT}"
fi

echo "Mounting directory '${MNT_DIR}' under '${MNT_PNT}'"
docker run --add-host=dockerhost:${DOCKER_HOST_IP} \
           --rm                                    \
           -it                                     \
           -v ${MNT_DIR}:${MNT_PNT}  \
           vim-devel:latest
