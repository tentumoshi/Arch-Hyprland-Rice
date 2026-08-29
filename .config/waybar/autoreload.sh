#!/bin/bash

while true; do
    inotifywait -e close_write,create,delete,move "$HOME/.config/waybar"

    killall waybar 2>/dev/null
    sleep 0.2
    waybar >/tmp/waybar.log 2>&1 &
done