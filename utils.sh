#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_green() {
    printf "\e[0;32m%b\e[0m" "$1"
}

print_in_red() {
    printf "\e[0;31m%b\e[0m" "$1"
}

print_in_yellow() {
    printf "\e[0;33m%b\e[0m" "$1"
}

print_in_purple() {
    printf "\e[0;35m%b\e[0m" "$1"
}

print_success() {
    print_in_green "  [✔] $1\n"
}

print_error() {
    print_in_red "  [✖] $1 $2\n"
}

print_warning() {
    print_in_yellow "  [!] $1\n"
}

print_info() {
    print_in_purple "\n $1\n\n"
}

print_question() {
    print_in_yellow "  [?] $1"
}

print_result() {

    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"

}

print_error_stream() {
    while read -r line; do
        print_error "$1 $line"
    done
}

skip_questions() {

     while :; do
        case $1 in
            -y|--yes) return 0;;
                   *) break;;
        esac
        shift 1
    done

    return 1

}

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask() {
    print_question "$1"
    read -r
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -r -n 1
    printf "\n"
}

get_answer() {
    printf "%s" "$REPLY"
}

ask_for_sudo() {

    # Ask for the administrator password upfront
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp until this script has finished
    # https://gist.github.com/cowboy/3118588
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &

}

execute() {

    local tmpFile="$(mktemp /tmp/XXXXX)"
    local exitCode=0

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    eval "$1" \
        &> /dev/null \
        2> "$tmpFile"

    print_result $? "${2:-$1}"
    exitCode=$?

    if [ $exitCode -ne 0 ]; then
        print_error_stream "↳ ERROR:" < "$tmpFile"
    fi

    rm -rf "$tmpFile"

    return $exitCode

}

os_distro() {
    awk -F= '/^NAME/{print $2}' /etc/os-release
}

is_fedora() {
    [[ "$(os_distro)" =~ ^[Ff]edora$ ]] \
        && return 0 \
        || return 1
}

is_ubuntu() {
    [[ "$(os_distro)" =~ ^[Uu]buntu$ ]] \
        && return 0 \
        || return 1
}

os_pkg() {
    if is_fedora; then
        echo "dnf"
    else
        echo "apt-get"
    fi
}

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed

    execute \
	"sudo $(os_pkg) autoremove -qqy" \
        "autoremove"

}

install_package() {

    declare -r PACKAGE="$1"

    if ! package_is_installed "$PACKAGE"; then
	execute "sudo $(os_pkg) install -qqy $PACKAGE"
  #                    suppress output ─┘│
  # "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE"
    fi

}

package_is_installed() {
    if is_fedora; then
        dnf list installed "$1" &> /dev/null
    elif is_ubuntu; then
        dpkg -s "$1" &> /dev/null
    fi
}

update() {

    # Resynchronize the package index files from their sources

    execute \
	"sudo $(os_pkg) update -qqy" \
        "update"
}

upgrade() {

    # Install the newest versions of all packages installed

    execute \
	"sudo $(os_pkg) upgrade -qqy" \
        "upgrade"

}
