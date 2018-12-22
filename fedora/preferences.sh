#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Set preferences"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Terminal"

execute "mkdir -p ~/.config/xfce4/terminal/ && ln -sf $PWD/terminalrc $HOME/.config/xfce4/terminal/terminalrc" "xfce4-terminal config"

print_info "Keyboard"
execute "sudo cp $PWD/00-keyboard.conf /etc/X11/xorg.conf.d/" "00-keyboard.conf"

print_info "Touchpad"
execute "sudo cp $PWD/70-touchpad.conf /etc/X11/xorg.conf.d/" "70-touchpad.conf"
execute "sudo cp $PWD/80-synaptics.conf /etc/X11/xorg.conf.d/" "80-synaptics.conf"

print_info "Apple keyboard"

execute "echo options hid_apple swap_opt_cmd=1 fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf" "Apple module keys fix"

execute "sudo dracut -f" "initramfs update"
