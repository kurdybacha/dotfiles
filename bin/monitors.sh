#!/bin/bash

autorandr --change
i3-msg "workspace 3, move workspace to output primary"
i3-msg "workspace 2, move workspace to output primary"
i3-msg "workspace 1, move workspace to output primary"
# intern=eDP1
# extern=DP1-3
#
# if [ "$1" == "camera" ]; then
#     xrandr --output DP1-3 --auto --primary --output eDP1 --auto --noprimary --right-of DP1-3
# else
#     if xrandr | grep "$extern connected"; then
#         xrandr --output "$intern" --off --output "$extern" --auto
#     else
#         echo "Only $intern"
#         xrandr --auto
#     fi
# fi
