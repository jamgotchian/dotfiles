#!/usr/bin/bash

# if ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it doesn't get overwritten
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' >~/.inputrc; fi

# Add shell option to ~/.inputrc to enable case insensitive tab completion
echo 'set completion-ignore-case On' >>~/.inputrc
