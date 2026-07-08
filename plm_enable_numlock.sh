#!/bin/bash

set -e

FILE="/var/lib/plasmalogin/.config/kdedefaults/kcminputrc"
DIR="/var/lib/plasmalogin/.config/kdedefaults"

echo "→ create directory:$DIR"
sudo mkdir -p "$DIR"

if [ ! -s "$FILE" ]; then
    echo "→ Write initial configuration"
    echo -e "[Keyboard]\nNumLock=0" | sudo tee "$FILE" > /dev/null
else
    echo "→ Additional settings"
    sudo bash -c "echo '' >> '$FILE' && echo '[Keyboard]' >> '$FILE' && echo 'NumLock=0' >> '$FILE'"
fi

sudo chown plasmalogin:plasmalogin "$FILE"

sudo chmod +x "$FILE"

echo "Done"