#!/usr/bin/env bash
set -euo pipefail

# Requires jq
command -v jq >/dev/null 2>&1 || exit 0

TARGET_WS="$1"

# Get focused monitor
FOCUSED_MONITOR="$(hyprctl -j monitors \
  | jq -r '.[] | select(.focused==true) | .name')"

[ -z "$FOCUSED_MONITOR" ] && exit 0

# Check if a special workspace is active on this monitor
SPECIAL_WS="$(hyprctl -j monitors \
  | jq -r --arg mon "$FOCUSED_MONITOR" \
    '.[] | select(.name==$mon) | .specialWorkspace.name // ""')"

# If a special workspace is active, exit it
if [ -n "$SPECIAL_WS" ]; then
  # Normalize "special:NAME" → NAME
  SPECIAL_WS="${SPECIAL_WS#special:}"
  hyprctl dispatch togglespecialworkspace "$SPECIAL_WS"
fi

# Switch to the target workspace
hyprctl dispatch workspace "$TARGET_WS"

