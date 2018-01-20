#!/bin/bash

declare skipQuestions=false

main() {
    # Check that everything runs relative to this file
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    # Load utils
    . "utils.sh" || exit 1

    # Check supported distros

    distro=$(echo $(os_distro) | tr '[:upper:]' '[:lower:]')
    case "$distro" in
        fedora)
            ;;
        ubuntu)
            ;;
        *)
            print_info "Unsupported distribution"
	    exit 1
    esac

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        chmod +x ./create_symbolic_links.sh
    ./create_symbolic_links.sh
        chmod +x ./vim/setup.sh
    ./vim/setup.sh

    if ! $skipQuestions; then

	print_info "Install mode"

        ask_for_confirmation "Do you want to configure your distro and install packages?"
        printf "\n"
        if answer_is_yes; then
		chmod +x ./$distro/setup.sh
	    ./$distro/setup.sh
	fi

	ask_for_confirmation "Do you want to install heavy dev tools (e.g. YouCompleteMe, rtags,..) ?"
        printf "\n"

        if answer_is_yes; then
		chmod +x ./install_from_github.sh
	    ./install_from_github.sh
	fi

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then

        print_info "Git"

        ask_for_confirmation "Do you want to setup git user and email?"
        printf "\n"

        if answer_is_yes; then
            ask "user.name: "
            git config --global user.name "$(get_answer)"
            ask "user.email: "
            git config --global user.email "$(get_answer)"
        fi

    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then

        print_info "Restart"

        ask_for_confirmation "Do you want to restart?"
        printf "\n"

        if answer_is_yes; then
            sudo shutdown -r now &> /dev/null
        fi

    fi
}

main "$@"
