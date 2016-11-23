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

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed

    execute \
        "sudo apt-get autoremove -qqy" \
        "autoremove"

}

install_package() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources

    execute \
        "sudo apt-get update -qqy" \
        "update"

}

upgrade() {

    # Install the newest versions of all packages installed

    execute \
        "sudo apt-get upgrade -qqy" \
        "upgrade"

}
