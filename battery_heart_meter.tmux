#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

meter_interpolation="\#{battery_heart_meter}"
heart_meter="#($CURRENT_DIR/scripts/battery_heart_meter.sh)"

do_interpolation() {
    local input=$1
    local result=""

    result=${input/$meter_interpolation/$heart_meter}

    echo $result
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
