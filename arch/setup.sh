#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./archlib.sh"

#ask_for_sudo

main() {
    install_fastest_mirror
    install_packages
    config_timezone
    config_hardwareclock
    config_keymap
    config_locale
    config_tlp
    config_networkmanager
    config_login_manager
    config_sudo
    config_backlight
}

main
