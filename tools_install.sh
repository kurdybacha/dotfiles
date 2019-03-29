#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "tools_lib.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    mkdir -p $INSTALL_PREFIX/bin
    rtags_install
    youcompleteme_install
    urxvt_extensions
    cquery_install
}

main "$@"
