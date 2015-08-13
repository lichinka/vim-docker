#!/bin/bash
set -e

# if command starts with an option, prepend vim
if [ "${1:0:1}" = '-' ]; then
	set -- vim "$@"
fi

if [ "$1" = 'vim' ]; then
	sudo chown -R dev:dev "$HOME/src"
fi

cd $HOME/src && \
exec "$@"
