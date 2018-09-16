#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

battery_heart_meter() {
    local red=$(get_tmux_option @heart_color "#[fg=$color_red]")
    local black=$(get_tmux_option @black_heart_color "#[fg=$color_black]")
    
    local heart="$(echo -e '\u2665')"

    percent="$(pmset -g batt | grep -o '[0-9]\{1,3\}%')"
    percent=$(echo "$percent" | grep -o '[0-9]\{1,3\}')

    remaining=$[$[$percent % 10]/2]
    used=$[5 - $remaining]

    left=""
    for i in `seq 1 $remaining`; do
        left="$left $heart";
    done

    right=""
    for i in `seq 1 $used`; do
        right="$right $heart";
    done
    echo "$red" "$right"
}

battery_heart_meter
