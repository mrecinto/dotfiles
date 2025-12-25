#!/usr/bin/env bash

pkill waybar || true
sleep 0.2

waybar &
disown
# waybar -c ~/.config/waybar/themes/ultra-minimal/config.jsonc -s ~/.config/waybar/themes/ultra-minimal/style.css &

