#!/bin/bash

dir="$(dirname "$0")"

PACKAGES="$dir/packages.list"

#----- Fancy Messages -----#
show_error() {
    echo -e "\033[1;31m *** $@ ***\033[m" 1>&2
}
show_info() {
    echo -e "\033[1;32m *** $@ ***\033[0m"
}
show_warning() {
    echo -e "\033[1;33m *** $@ ***\033[0m"
}
show_question() {
    echo -e "\033[1;34m *** $@ ***\033[0m"
}
show_success() {
    echo -e "\033[1;35m *** $@ ***\033[0m"
}
show_header() {
    echo -e "\033[1;36m *** $@ ***\033[0m"
}
show_listitem() {
    echo -e "\033[0;37m *** $@ ***\033[0m"
}

install_package() {
    PKGCHECK=$(dnf list installed | grep "^$1")
    if [ "" == "$PKGCHECK" ]; then
        show_info "Package '$1' is not installed. Installing..."
        sudo dnf install -y "$1"
        show_success 'Done.'
    else
        show_success "Package '$1' is installed."
    fi
}

install_packages() {
    for PACKAGE in $(cat $1)
    do
        install_package "$PACKAGE"
    done

}

install_packages "$dir/utils.list"
install_packages "$dir/development.list"
install_packages "$dir/favourites.list"
