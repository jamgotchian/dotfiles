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

# Apply based on which shell is running
if [ -n "$ZSH_VERSION" ]; then
    SHELL=${HOME}/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    SHELL=${HOME}/.bashrc
fi
echo >>$SHELL
signfile $SHELL

# Get the directory of the script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo "Do you want $SHELL to source: "
for file in "${SCRIPT_DIR}/dot-config/shell"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename}?"; then
            echo "source $(realpath "$file")" >>$SHELL
        fi
    fi
done

signfile $SHELL
