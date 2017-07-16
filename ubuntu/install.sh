#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {

    wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output

}

add_ppa() {
    sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
    sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}


install_packages() {


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    update
    upgrade

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Tools for compiling/building software from source

    install_package "build-essential"

    install_package "clang"

    install_package "libclang-dev"

    install_package "libtool"

    install_package "autoconf"

    install_package "cmake"

    install_package "libboost-all-dev"

    install_package "flex"

    install_package "bison"

    install_package "libevent-dev"

    install_package "python-dev"

    install_package "python-pip"

    install_package "python-numpy"

    install_package "python-wheel"

    install_package "swig"

    install_package "python3-dev"

    install_package "python3-numpy"

    install_package "python3-wheel"

    install_package "linux-tools-generic"

    install_package "libssl-dev"

    install_package "libcurl4-openssl-dev"

    install_package "uuid-dev"

    install_package "linux-tools-common"

    # GnuPG archive keys of the Debian archive
    #install_package "GnuPG archive keys" "debian-archive-keyring"

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "chromium-browser"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "curl"


    install_package "git"


    install_package "gitk"


    install_package "vim-gnome"


    install_package "ctags"


    install_package "cgdb"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #install_package "ImageMagick" "imagemagick"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tmux"


    install_package "tmuxinator"


    install_package "mc"


    install_package "tree"


    install_package "htop"


    install_package "silversearcher-ag"


    install_package "vlc"


    install_package "fonts-inconsolata"


    install_package "ranger"


    install_package "indicator-multiload"


    print_in_green "\n  ---\n\n"
    update
    upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    autoremove

}

install_packages
