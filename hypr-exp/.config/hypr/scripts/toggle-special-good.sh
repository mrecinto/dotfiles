#!/usr/bin/env bash
set -euo pipefail

command -v jq >/dev/null 2>&1 || exit 0

STATE_DIR="$HOME/.local/state/hypr"
mkdir -p "$STATE_DIR"

# Focused monitor
focused_mon="$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name' | head -n1)"
[ -z "$focused_mon" ] && exit 0

STATE_FILE="$STATE_DIR/last-special-$focused_mon"

# Current special workspace on focused monitor
sw="$(hyprctl -j monitors | jq -r --arg mon "$focused_mon" \
  '.[] | select(.name==$mon) | .specialWorkspace.name // ""')"

# Normalize
sw="${sw#special:}"

if [ -n "$sw" ]; then
  # We are currently in a special workspace → remember & exit
  echo "$sw" > "$STATE_FILE"
  hyprctl dispatch togglespecialworkspace "$sw"
else
  # Not in a special → restore last one (if any)
  if [ -f "$STATE_FILE" ]; then
    last="$(cat "$STATE_FILE")"
    [ -n "$last" ] && hyprctl dispatch togglespecialworkspace "$last"
  fi
fi

