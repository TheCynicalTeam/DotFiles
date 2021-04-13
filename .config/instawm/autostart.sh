#!/usr/bin/env bash

# path:       ~/.config/dwm/autostart.sh
# author:     The-Repo-Club [wayne6324@gmail.com]
# github:     https://github.com/The-Repo-Club/instawm
# date:       2021-04-10 12:34:47.440579
#

if ! command -v xautolock &> /dev/null; then
    echo "xautolock could not be found"
    exit
else
    xautolock -time 10 -locker 'multimonitorlock -l -- --timestr="%H:%M"' -notify 30 -notifier "notify-send -u critical -- 'LOCKING screen in 30 seconds'" &
fi
