#!/bin/bash
# Get SSID and signal strength for the active wifi connection
WIFI_INFO=$(distrobox-host-exec nmcli -t -f active,ssid,signal dev wifi | grep '^yes')

if [ -n "$WIFI_INFO" ]; then
    SSID=$(echo "$WIFI_INFO" | cut -d: -f2)
    SIGNAL=$(echo "$WIFI_INFO" | cut -d: -f3)
    echo "  $SSID $SIGNAL%"
else
    echo "Disconnected ⚠"
fi
