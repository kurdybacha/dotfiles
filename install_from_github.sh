#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# rtags - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
execute "git -C rtags pull --recurse-submodules && cd rtags && git submodule update --remote --recursive || git clone --recursive https://github.com/Andersbakken/rtags.git" \
        "rtags pull"
execute "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . && make -j4 && sudo make install" \
        "rtags build"
