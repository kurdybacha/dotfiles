#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

chmod +x ./install.sh
    ./install.sh
chmod +x ./preferences.sh
    ./preferences.sh
