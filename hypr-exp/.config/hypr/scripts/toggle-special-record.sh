#!/usr/bin/env bash
set -euo pipefail

command -v jq >/dev/null 2>&1 || exit 0

STATE_DIR="$HOME/.local/state/hypr"
mkdir -p "$STATE_DIR"

focused_mon="$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name')"
[ -z "$focused_mon" ] && exit 0

STATE_FILE="$STATE_DIR/last-special-$focused_mon"
target="$1"

[ -z "$target" ] && exit 0

current="$(hyprctl -j monitors | jq -r --arg m "$focused_mon" \
  '.[] | select(.name==$m) | .specialWorkspace.name // ""')"

current="${current#special:}"

# If already in this special → exit it
if [ "$current" = "$target" ]; then
  echo "$target" > "$STATE_FILE"
  hyprctl dispatch togglespecialworkspace "$target"
  exit 0
fi

# Switching special → special OR normal → special
echo "$target" > "$STATE_FILE"
hyprctl dispatch togglespecialworkspace "$target"

