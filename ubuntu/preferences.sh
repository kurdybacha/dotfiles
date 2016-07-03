#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "Set preferences"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info " Privacy"

execute "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'" \
    "Turn off 'Remote Search' so that search terms in Dash do not get sent over the internet"

execute "gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false" \
    "Disable Dash 'More suggestions' section"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info " Terminal"

execute "gsettings set org.gnome.desktop.interface monospace-font-name 'Inconsolata 13'" \
    "Change font size"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info " UI"

execute "gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1" \
    "Auto-hide the Launcher"

execute "gsettings set com.canonical.indicator.bluetooth visible false" \
    "Hide bluetooth icon from the menu bar"

execute "gsettings set com.canonical.indicator.sound visible false" \
    "Hide volume icon from the menu bar"

execute "gsettings set com.canonical.indicator.power icon-policy 'charge' && \
         gsettings set com.canonical.indicator.power show-time true" \
    "Hide battery icon from the menu bar when the battery is not in use"

execute "gsettings set org.gnome.desktop.input-sources sources \"[('xkb', 'pl'), ('xkb', 'us')]\"" \
    "Set keyboard layouts (pl, us)"

execute "gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:escape']\"" \
    "Make Caps Lock and additional ESC"

execute "gsettings set com.canonical.Unity.Launcher favorites \"[
            'ubiquity-gtkui.desktop',
            'nautilus-home.desktop'
         ]\"" \
    "Set Launcher favorites"

execute "gsettings set com.canonical.indicator.datetime show-week-numbers true" \
    "Show week numbers in calendar"

execute "gsettings set com.canonical.indicator.datetime custom-time-format '%d %b   %k:%M' && \
         gsettings set com.canonical.indicator.datetime time-format 'custom'" \
"Use custom date format in the menu bar"

execute "dconf load /de/mh21/indicator-multiload/ < dconf/indicator-multiload.dconf" \
    "System Load Indicator (dconf settings)"
