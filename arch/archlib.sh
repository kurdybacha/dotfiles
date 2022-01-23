#!/bin/bash

asudo=''
if (( $EUID != 0 )); then
    asudo='sudo'
fi

install_packages() {
    $asudo pacman -Syu
    for package in $(cat packages.txt); do
        $asudo pacman -S --noconfirm --needed $package
    done
}

config_fastest_mirror() {
    $asudo systemctl enable reflector.service
    $asudo systemctl start reflector.service
}

config_timezone() {
    $asudo ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime
}

config_hardwareclock() {
    $asudo hwclock --systohc --localtime
}

config_locale() {
    echo "LANG=en_US.UTF-8" | $asudo tee /etc/locale.conf
    echo "LANGUAGE=en_US:en" | $asudo tee -a /etc/locale.conf
    $asudo sed -i 's/#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen
    $asudo sed -i 's/#\(en_US ISO-8859-1\)/\1/' /etc/locale.gen
    $asudo sed -i 's/#\(pl_PL.UTF-8\)/\1/' /etc/locale.gen
    $asudo sed -i 's/#\(pl_PL ISO-8859-2\)/\1/' /etc/locale.gen
    $asudo locale-gen
}

config_keymap() {
    echo "KEYMAP=pl" | $asudo tee /etc/vconsole.conf
    echo options hid_apple swap_opt_cmd=1 fnmode=2 | $asudo tee /etc/modprobe.d/hid_apple.conf
}

config_tlp() {
    $asudo systemctl enable tlp.service
    $asudo systemctl start tlp.service
    $asudo systemctl mask systemd-rfkill.service
    $asudo systemctl mask systemd-rfkill.socket
}

#config_networkmanager() {
#    $asudo systemctl enable NetworkManager
#    $asudo systemctl start NetworkManager
#}

config_timesync() {
    $asudo systemctl enable systemd-timesyncd
    $asudo systemctl start systemd-timesyncd
}

config_login_manager() {
    $asudo systemctl enable lightdm.service
    $asudo sed -i 's/#greeter-session=.*/greeter-session=lightdm-gtk-greeter/g' \
        /etc/lightdm/lightdm.conf
}


# Enable sudo and nopass shutdown
config_sudo() {
    $asudo sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/g' \
        /etc/sudoers
    NOPASS_SHUTDOWN="%wheel ALL = NOPASSWD: /usr/bin/shutdown, /usr/bin/reboot"
    $asudo grep -q "${NOPASS_SHUTDOWN}" /etc/sudoers && \
        echo "${NOPASS_SHUTDOWN}" | $asudo tee -a /etc/sudoers
}

config_backlight() {
    $asudo systemctl enable systemd-backlight
    $asudo systemctl start systemd-backlight
}
