#!/bin/bash
intern=eDP1
extern=DP1-3

if [ "$1" == "camera" ]; then
    xrandr --output DP1-3 --auto --primary --output eDP1 --auto --noprimary --right-of DP1-3
else
    if xrandr | grep "$extern connected"; then
        xrandr --output "$intern" --off --output "$extern" --auto
    else
        echo "Only $intern"
        xrandr --auto
    fi
fi
