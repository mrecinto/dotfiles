#!/usr/bin/env bash
set -euo pipefail

# Require jq
command -v jq >/dev/null 2>&1 || exit 0

# Focused monitor name
focused_mon="$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name' | head -n1)"
[ -z "$focused_mon" ] && exit 0

# Special workspace name on focused monitor (empty if none)
sw="$(hyprctl -j monitors | jq -r --arg mon "$focused_mon" '.[] | select(.name==$mon) | .specialWorkspace.name // ""')"
[ -z "$sw" ] && exit 0

# Some builds return "special:NAME"; normalize to NAME
sw="${sw#special:}"

# If it becomes empty (unnamed special), toggle without arg
if [ -z "$sw" ]; then
  hyprctl dispatch togglespecialworkspace
else
  hyprctl dispatch togglespecialworkspace "$sw"
fi

