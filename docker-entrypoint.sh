#!/bin/bash
set -e

#
# set UID from the host
#
usermod  -u ${HOST_UID} dev > /dev/null 2>&1

# if command starts with an option, prepend vim
if [ "${1:0:1}" = '-' ]; then
	set -- vim "$@"
fi

if [ "$1" = 'vim' ]; then
    echo "Starting VIM ..."
fi

cd $HOME/src && \
exec "$@"
