#!/bin/bash
# Low-impact RAM usage reading /proc/meminfo directly
while read -r line; do
    case "$line" in
        MemTotal:*) total=$(echo "$line" | awk '{print $2}') ;;
        MemAvailable:*) available=$(echo "$line" | awk '{print $2}') ;;
    esac
done < /proc/meminfo

if [ -n "$total" ] && [ -n "$available" ]; then
    used=$((total - available))
    usage=$((used * 100 / total))
    printf "%d%%  \n" "$usage"
else
    echo "0%  "
fi
