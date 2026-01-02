#!/usr/bin/env bash
set -euo pipefail

command -v jq >/dev/null 2>&1 || exit 0

STATE_DIR="$HOME/.local/state/hypr"
mkdir -p "$STATE_DIR"

# Focused monitor
MON="$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name')"
[ -z "$MON" ] && exit 0

STATE_FILE="$STATE_DIR/last-normal-$MON"

# Current special workspace
SPECIAL_WS="$(hyprctl -j monitors | jq -r --arg mon "$MON" \
  '.[] | select(.name==$mon) | .specialWorkspace.name // ""')"

SPECIAL_WS="${SPECIAL_WS#special:}"

if [ -n "$SPECIAL_WS" ]; then
  # We are IN a special workspace → return to last normal
  if [ -f "$STATE_FILE" ]; then
    hyprctl dispatch workspace "$(cat "$STATE_FILE")"
  else
    hyprctl dispatch togglespecialworkspace "$SPECIAL_WS"
  fi
else
  # We are NOT in a special workspace → open magic
  hyprctl dispatch togglespecialworkspace magic
fi

