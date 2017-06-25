#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

if [ ! -d "bundle/neobundle.vim" ]; then
    git clone https://github.com/Shougo/neobundle.vim.git bundle/neobundle.vim
fi
bundle/neobundle.vim/bin/neoinstall
cd bundle/YouCompleteMe && install.py --clang-completer
