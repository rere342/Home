#!/bin/bash
# Lid switch handler for Hyprland (Lua config).
#   lid.sh close — turn off the laptop panel, but only if the external monitor is connected
#   lid.sh open  — turn the laptop panel back on at its usual place
EXTERNAL="HDMI-A-3"

case "$1" in
    close)
        if hyprctl monitors | grep -q "^Monitor ${EXTERNAL} "; then
            hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
        fi
        ;;
    open)
        hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "1920x0", scale = 1.5, disabled = false })'
        ;;
esac
