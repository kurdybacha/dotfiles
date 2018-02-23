#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Set preferences"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info " Terminal"

execute "mkdir -p ~/.config/xfce4/terminal/ && ln $PWD/terminalrc $HOME/.config/xfce4/terminal/terminalrc" "xfce4-terminal config"

#execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Inconsolata 13'" \
#    "Change font size"
#
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#
#print_info " UI"
#
#execute "dconf write /org/gnome/desktop/peripherals/touchpad/tap-to-click true" \
#    "Touchpad Tap to Click"
#
#execute "gsettings set org.gnome.desktop.input-sources sources \"[('xkb', 'pl'), ('xkb', 'us')]\"" \
#    "Set keyboard layouts (pl, us)"
#
execute "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:escape']\"" \
    "Make Caps Lock and additional ESC"

print_info "Apple keyboard"

execute "echo options hid_apple swap_opt_cmd=1 fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf" "Apple module keys fix"


execute "sudo dracut -f" "initramfs update"
