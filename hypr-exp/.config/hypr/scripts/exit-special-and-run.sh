#!/usr/bin/env bash
set -euo pipefail

command -v jq >/dev/null 2>&1 || exit 0

focused_mon="$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name')"
[ -z "$focused_mon" ] && exit 0

sw="$(hyprctl -j monitors | jq -r --arg m "$focused_mon" \
  '.[] | select(.name==$m) | .specialWorkspace.name // ""')"

sw="${sw#special:}"

# If currently in a special workspace → exit it
if [ -n "$sw" ]; then
  hyprctl dispatch togglespecialworkspace "$sw"
fi

# Run the requested Hyprland command
hyprctl dispatch "$@"

