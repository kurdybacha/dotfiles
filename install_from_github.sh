#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# rtags - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
execute "git clone --recursive https://github.com/Andersbakken/rtags.git" \
        "rtags clone"
execute "cd rtags && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . && make -4" \
        "rtags build"
