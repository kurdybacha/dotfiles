#!/bin/bash

declare skipQuestions=false

create_symlinks() {
    chmod +x ./create_symbolic_links.sh
    ./create_symbolic_links.sh
    chmod +x ./vim/setup.sh
    ./vim/setup.sh
}

configure_os() {
    # Check supported distros

    distro=$(echo $(os_distro) | tr '[:upper:]' '[:lower:]' | awk '{print $1}')
    case "$distro" in
        arch)
            ;;
        fedora)
            ;;
        *)
            print_info "Unsupported distribution"
            exit 1
    esac

    chmod +x ./xorg/setup.sh
    ./xorg/setup.sh
    chmod +x ./$distro/setup.sh
    ./$distro/setup.sh

    print_info "Git"
    git config --global mergetool.keepBackup false
    git config --global merge.tool vimdiff
    if ! $skipQuestions; then
        ask_for_confirmation "Do you want to setup git user and email?"
        printf "\n"
        if answer_is_yes; then
            ask "user.name: "
            git config --global user.name "$(get_answer)"
            ask "user.email: "
            git config --global user.email "$(get_answer)"
        fi
    fi
}

install_extra() {
    chmod +x ./github_installs.sh
    ./github_installs.sh
}

run_all() {
    create_symlinks
    configure_os
    install_extra
}

show_help() {
    echo "Usage: $(basename "$0") [options]" >&2
    echo
    echo "   -l, --link             Create symbolic links"
    echo "   -c, --config           Configures your system (install packages, xorg, keyboard, ...)"
    echo "   -i, --install          Install (extra) software (rtags, youcompleteme, ...)"
    echo "   -a, --all              Does all of the above"
    echo
    exit 1
}

main() {
    # Check that everything runs relative to this file
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    # Load utils
    . "utils.sh" || exit 1

    skip_questions "$@" \
        && skipQuestions=true

    if [ $# -eq 0 ]; then
        show_help
    else
        for i in "$@"
        do
            case $i in
                -l|--link)
                    create_symlinks
                    shift
                    ;;
                -i|--install)
                    install_extra
                    shift
                    ;;
                -c|--config)
                    configure_os
                    shift
                    ;;
                -a|--all)
                    run_all
                    shift
                    ;;
                *)
                    show_help
                    shift
                    ;;
            esac
        done
    fi
}

main "$@"
