#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_packages() {


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    update
    upgrade

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Tools for compiling/building software from source

    install_package "Build Essential" "build-essential"

    install_package "linux-tools-common" "linux-tools-common"

    install_package "Clang" "clang"

    # GnuPG archive keys of the Debian archive
    #install_package "GnuPG archive keys" "debian-archive-keyring"

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "google-chrome-unstable"; then

        add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
            || print_error "Chrome Canary (add key)"

        add_to_source_list "[arch=amd64] https://dl.google.com/linux/deb/ stable main" "google-chrome.list" \
            || print_error "Chrome Canary (add to package resource list)"

        update &> /dev/null \
            || print_error "Chrome Canary (resync package index files)"

    fi

    install_package "Chrome Canary" "google-chrome-unstable"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Chromium" "chromium-browser"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #install_package "cURL" "curl"

    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #if ! package_is_installed "firefox-trunk"; then

    #    add_ppa "ubuntu-mozilla-daily/ppa" \
    #        || print_error "Firefox Nightly (add PPA)"

    #    update &> /dev/null \
    #        || print_error "Firefox Nightly (resync package index files)" \

    #fi

    #install_package "Firefox Nightly" "firefox-trunk"

    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #install_package "Flash" "flashplugin-installer"

    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #install_package "GIMP" "gimp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GNOME Vim" "vim-gnome"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "cgdb" "cgdb"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #install_package "ImageMagick" "imagemagick"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tmux" "tmux"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Tmuxinator" "tmuxinator"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Midnight Commander" "mc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "The Silver Searcher" "silversearcher-ag"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "VLC" "vlc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Inconsolata font" "fonts-inconsolata"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "System Load indicators" "indicator-multiload"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    update
    upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    autoremove

}

install_packages
