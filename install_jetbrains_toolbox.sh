#!/bin/bash

set -e

if [ -d ~/.local/share/JetBrains/Toolbox ]; then
    echo "This application is already installed"
    exit 0
fi

echo "Instalation process is starting..."

wget --show-progress -qO ./toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

TOOLBOX_TEMP_DIR=$(mktemp -d)

tar -C "$TOOLBOX_TEMP_DIR" -xf toolbox.tar.gz
rm ./toolbox.tar.gz

"$TOOLBOX_TEMP_DIR"/*/jetbrains-toolbox

rm -r "$TOOLBOX_TEMP_DIR"

echo "JetBrains Toolbox App will open shortly ..."

