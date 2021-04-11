#!/usr/bin/env bash

# path:       ~/.config/dwm/autostart.sh
# author:     The-Repo-Club [wayne6324@gmail.com]
# github:     https://github.com/The-Repo-Club/instawm
# date:       2021-04-10 12:34:47.440579

if ! command -v xsettingsd &> /dev/null; then
    echo "xsettingd could not be found"
    exit
else
    xsettingsd &
fi
