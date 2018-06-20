#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# rtags - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ -d rtags ]; then
    execute "git -C rtags pull --recurse-submodules" "rtags pull"
else
    execute "git clone --recurse-submodule https://github.com/Andersbakken/rtags.git" "rtags clone"
fi

execute "cd rtags && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . && make -j4 && sudo make install" "rtags build"

cd "$(dirname "${BASH_SOURCE[0]}")"

# YouCompleteMe
if [ -d "vim/plugged/YouCompleteMe" ]; then
    execute "git -C vim/plugged/YouCompleteMe pull --recurse-submodule" "YouCompleteMe pull"
else
    execute "git clone --recurse-submodules https://github.com/Valloric/YouCompleteMe.git vim/plugged/YouCompleteMe" "YouCompleteMe clone"
fi
execute "cd vim/plugged/YouCompleteMe && ./install.py --clang-completer" "YouCompleteMe build"

# Powerline fonts
execute "git clone https://github.com/powerline/fonts.git --depth=1" "Powerline font pull"
execute "cd fonts && ./install.sh && cd .. && rm -rf fonts" "Powerline font install"
