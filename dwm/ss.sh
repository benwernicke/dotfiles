#!/bin/sh
echo -e "\u001b[35;1m $(emote) "
echo -e " \u001b[36;1m$(/home/ben/Programs/dwm/cpu.sh | grep '%')| $(pfetch | grep 'memory' | grep -Eo '[0-9]?[0-9]{3}M / ....M') "
echo  -e "\u001b[33;1m $(date +"%H:%M") "
echo -e " \u001b[32m$(upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage" | grep 'percentage' | grep -Eo '...%') \u001b[0m"
