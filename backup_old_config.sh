#!/bin/bash

mv ~/.config/nvim ~/.config/nvim.bak

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

echo "Backup successful!"

