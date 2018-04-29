#!/bin/sh

set -e

HDMI=$(</sys/class/drm/card0-HDMI-A-1/status)

#export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')
export DISPLAY=:0
# export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')
export XAUTHORITY=/home/pawel

if [ "$HDMI" == "connected" ]; then
    logger -t HDMI-1 "connected"
    xrandr --output eDP-1 --off --output HDMI-1 --auto
else
    logger -t HDMI-1 "disconnected"
    xrandr --output eDP-1 --auto --output HDMI-1 --auto
fi
