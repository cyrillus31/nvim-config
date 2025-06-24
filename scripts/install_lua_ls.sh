#!/bin/bash

# https://luals.github.io/#neovim-install

brew install lua-language-server
if [[ ! $? -eq 0 ]]; then
    echo "Homebrew is not installed. Trying building from source..."
else
    return 0
fi;

# BUILD FROM SCRATCH
# https://luals.github.io/wiki/build/

# 1. Install Ninja
brew install ninja -y
if [[ ! $? -eq 0 ]]; then
    echo "Homebrew is not available."
fi;

sudo dnf install ninja-build -y && sudo dnf install libstdc++-static -y
if [[ ! $? -eq 0 ]]; then
    echo "DNF is not available."
fi;

# sudo apt-get install ninja-build
# if [[ ! $? -eq 0 ]]; then
#     echo "APT is not available."
# fi;

# 2. Clone source code repository
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server

# 3. Run the make script
sudo ./make.sh

# 4. Clean up
# cd ..
# rm -rf lua-language-server

