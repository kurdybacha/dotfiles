#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Set preferences"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#print_info " Terminal"

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

execute "printf '%s\n%s\n%s\n' '#!/bin/bash' 'echo 2 > /sys/module/hid_apple/parameters/fnmode' 'echo 1 > /sys/module/hid_apple/parameters/swap_opt_cmd' \
                | sudo tee /etc/sysconfig/modules/apple_keys_fix.modules" \
        "Apple keys fix module"
execute "sudo chmod +x /etc/sysconfig/modules/apple_keys_fix.modules && sudo /etc/sysconfig/modules/apple_keys_fix.modules" "Apple keys fix enable"
