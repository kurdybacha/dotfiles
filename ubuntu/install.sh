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

    install_package "build-essential" "build-essential"

    install_package "clang" "clang"

    install_package "libclang-dev" "libclang-dev"

    install_package "libtool" "libtool"

    install_package "autoconf" "autoconf"

    install_package "cmake" "cmake"

    install_package "python-dev" "python-dev"

    install_package "python-pip" "python-pip"

    install_package "python-numpy" "python-numpy"

    install_package "python-wheel" "python-wheel"

    install_package "swig" "swig"

    install_package "python3-dev" "python3-dev"

    install_package "python3-numpy" "python3-numpy"

    install_package "python3-wheel" "python3-wheel"

    install_package "linux-tools-generic" "linux-tools-generic"

    install_package "libssl-dev" "libssl-dev"

    install_package "libcurl4-openssl-dev" "libcurl4-openssl-dev"

    install_package "uuid-dev" "uuid-dev"


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

    install_package "gitk" "gitk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GNOME Vim" "vim-gnome"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ctags" "ctags"

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

    install_package "tree" "tree"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "htop" "htop"

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
