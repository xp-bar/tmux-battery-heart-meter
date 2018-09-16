#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-option -gq "#{battery_heart_meter}" "$CURRENT_DIR/scripts/tmux_battery_heart_meter.sh"
