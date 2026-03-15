#!/bin/bash
# Low-impact CPU usage using /proc/stat delta stored in /tmp
STATE_FILE="/tmp/ironbar-cpu-state"

read -r _ u2 n2 s2 i2 io2 ir2 si2 st2 g2 gn2 < /proc/stat
total2=$((u2 + n2 + s2 + i2 + io2 + ir2 + si2 + st2))
idle2=$((i2 + io2))

if [ -f "$STATE_FILE" ]; then
    read -r total1 idle1 < "$STATE_FILE"
    total_d=$((total2 - total1))
    idle_d=$((idle2 - idle1))
    
    if [ "$total_d" -gt 0 ]; then
        usage=$(( (total_d - idle_d) * 100 / total_d ))
        printf "%d%%  \n" "$usage"
    else
        echo "0%  "
    fi
else
    echo "0%  "
fi

echo "$total2 $idle2" > "$STATE_FILE"
