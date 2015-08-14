#!/bin/bash
set -e

#
# set UID from the host
#
usermod -u ${HOST_UID} dev > /dev/null 2>&1
cd /home/dev/src

EXE_CMD="$@"
su -m -c "${EXE_CMD}" dev
