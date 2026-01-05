#!/usr/bin/env bash

HOUR=$(date +%H)

DAY="$HOME/Pictures/Wallpapers/F42-01-day.jpg"
NIGHT="$HOME/Pictures/Wallpapers/F42-01-night.jpg"

# Day: 06–18
if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 18 ]; then
    echo "$DAY"
else
    echo "$NIGHT"
fi

