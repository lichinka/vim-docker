#!/usr/bin/bash

echo "Make sure you checked the 'vimrc' in this directory before building."
echo "Press any key to continue or Ctrl+C to exit ..."
read -n 1

docker build --no-cache=true -t vim-devel .
#docker build -t vim-devel .
