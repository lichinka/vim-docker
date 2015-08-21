#!/bin/bash
set -e

#
# set UID from the host
#
usermod  -ou ${HOST_UID} dev > /dev/null 2>&1
groupmod -og ${HOST_GID} dev > /dev/null 2>&1
cd /home/dev/src

EXE_CMD="$@"
su -m -c "${EXE_CMD}" dev
