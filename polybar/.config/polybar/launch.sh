#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch left, center, right bars
echo "---" | tee -a /tmp/polybarLeft.log /tmp/polybarCenter.log /tmp/polybarRight.log

polybar left 2>&1 | tee -a /tmp/polybarLeft.log & disown
polybar center 2>&1 | tee -a /tmp/polybarCenter.log & disown
polybar right 2>&1 | tee -a /tmp/polybarRight.log & disown

echo "Bars launched..."
