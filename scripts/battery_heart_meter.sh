#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

battery_heart_meter() {
    unset red, black, heart_icon, heart
    local red=$(get_tmux_option "@heart_color" "#[fg=red]")
    local black=$(get_tmux_option "@black_heart_color" "#[fg=black]")
    
    local heart_icon="$(echo -e '\u2665')"
    local heart=$(get_tmux_option "@heart_icon" "$heart_icon")

    percent="$(pmset -g batt | grep -o '[0-9]\{1,3\}%')"
    percent=$(echo "$percent" | grep -o '[0-9]\{1,3\}')

    remaining=$(round "$(bc <<< "scale=2 ; $percent/100*5")")
    used=$[5 - $remaining]

    left=""
    if [[ $remaining > 0 ]]; then
        for i in `seq 1 $remaining`; do
            left="$left $heart";
        done
    fi 

    right=""
    if [[ $used > 0 ]]; then
        for i in `seq 1 $used`; do
            right="$right $heart";
        done
    fi
    printf "$red$left$black$right"
}

battery_heart_meter
