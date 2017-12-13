#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

install_packages_list() {
    for PACKAGE in $(cat $1)
    do
        install_package "$PACKAGE"
    done

}

install_packages() {
    update
    upgrade
    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_packages_list "utils.list"
    install_packages_list "development.list"
    install_packages_list "favourites.list"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    update
    upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    autoremove
}

install_preferences() {
    chmod +x ./preferences.sh
    ./preferences.sh
}

install_packages
install_preferences
