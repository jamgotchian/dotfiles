#!/usr/bin/bash

function ask() {
    read -p "$1 (Y/n): " resp
    if [[ -z "$resp" ]]; then
        echo "no response"
        response='n'
    else
        response=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
        #echo "valid response"
    fi

    [ "$response" == "y" ]
}

function signfile() {
    echo '# ---------------------- jamgotchian:dotfiles install --------------------' >>$1
}

SHELL=${HOME}/.bashrc
echo >>$SHELL
signfile $SHELL

echo "Do you want $SHELL to source: "
for file in "shell"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename}?"; then
            echo "source $(realpath "$file")" >>$SHELL
        fi
    fi
done

signfile $SHELL

# git config
if ask ".gitconfig?"; then
    ln -s "$(realpath ".gitconfig")" ~/.gitconfig
fi

# Tmux conf
# if ask ".tmux.conf?"; then
#     ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
# fi

# vim conf
if ask ".vimrc?"; then
    ln -s "$(realpath ".vimrc")" ~/.vimrc
fi
