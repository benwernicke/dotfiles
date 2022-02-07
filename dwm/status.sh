#!/bin/sh
while true; do
    xsetroot -name " $(emote) | $(/home/ben/Programs/dwm/cpu.sh | grep '%')| $(pfetch | grep 'memory' | grep -Eo '[0-9]?[0-9]{3}M / ....M') | $(date +"%H:%M") | $(upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage" | grep 'percentage' | grep -Eo '...%')"
    sleep 10s
done
