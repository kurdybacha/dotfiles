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

	chmod +x ./create_symbolic_links.sh
    ./create_symbolic_links.sh
	chmod +x ./$distro/setup.sh
    ./$distro/setup.sh
	chmod +x ./vim/setup.sh
    ./vim/setup.sh

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
