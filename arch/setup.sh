#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

ask_for_sudo

for package in $(cat packages.txt); do
    sudo pacman -S --noconfirm $package
done

echo "KEYMAP=pl" | sudo tee /etc/vconsole.conf

sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl start tlp-sleep.service
sudo systemctl start tlp.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
