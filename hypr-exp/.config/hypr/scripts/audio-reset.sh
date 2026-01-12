#!/usr/bin/env bash

notify-send "Audio reset" "Restarting audio + Bluetooth"

# Restart PipeWire stack
systemctl --user restart pipewire pipewire-pulse wireplumber

# Restart Bluetooth (requires sudo NOPASSWD)
sudo systemctl restart bluetooth

# Give PipeWire time to rebind
sleep 2

# Force rescan
wpctl status >/dev/null 2>&1

notify-send "Audio reset" "Done"

