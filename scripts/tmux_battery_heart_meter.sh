#!/usr/bin/env bash
battery_heart_bar() {
    redheart="\e[31m\u2665"

    blackheart="\e[30m\u2665"

    percent="$(pmset -g batt | grep -o '[0-9]\{1,3\}%')"
    percent=$(echo "$percent" | grep -o '[0-9]\{1,3\}')

    remaining=$[$[$percent % 10]/2]
    used=$[5 - $remaining]

    left=""
    for i in `seq 1 $remaining`; do
        left="$left $redheart";
    done

    right=""
    for i in `seq 1 $used`; do
        right="$right $blackheart";
    done
    echo -e $left $right
}

battery_heart_bar
