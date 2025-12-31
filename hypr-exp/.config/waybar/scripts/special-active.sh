#!/usr/bin/env bash

hyprctl -j monitors \
| jq -r '.[] | select(.focused==true) | .specialWorkspace.name' \
| grep -q . && echo "●"

