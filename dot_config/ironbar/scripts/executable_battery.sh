#!/bin/bash
PERCENT=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

ICON=""
if [ "$PERCENT" -le 20 ]; then ICON="";
elif [ "$PERCENT" -le 40 ]; then ICON="";
elif [ "$PERCENT" -le 60 ]; then ICON="";
elif [ "$PERCENT" -le 80 ]; then ICON="";
fi

if [ "$STATUS" = "Charging" ]; then
    echo "$PERCENT% "
else
    echo "$PERCENT% $ICON"
fi
