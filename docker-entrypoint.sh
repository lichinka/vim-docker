#!/bin/bash
set -e

#
# set GID and UID from the host
#
usermod  -ou ${HOST_UID} dev > /dev/null 2>&1
groupmod -og ${HOST_GID} dev > /dev/null 2>&1
#chown --recursive dev:dev /home/dev
cd /home/dev/src

#
# cannot run as 'dev' user because of a Docker bug on OSX (see https://github.com/boot2docker/boot2docker/issues/581)
#
EXE_CMD="$@"
exec ${EXE_CMD}
#su -m -c "${EXE_CMD}" dev
