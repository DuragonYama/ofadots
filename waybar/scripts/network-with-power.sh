#!/bin/bash

# Get network status
if nmcli -t -f STATE general | grep -q "connected"; then
    SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    SIGNAL=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)
    IP=$(ip -4 addr show wlp0s20f3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+')
    
    # Get bandwidth (roughly)
    RX=$(cat /sys/class/net/wlp0s20f3/statistics/rx_bytes)
    TX=$(cat /sys/class/net/wlp0s20f3/statistics/tx_bytes)
    sleep 1
    RX_NEW=$(cat /sys/class/net/wlp0s20f3/statistics/rx_bytes)
    TX_NEW=$(cat /sys/class/net/wlp0s20f3/statistics/tx_bytes)
    DOWN=$(( (RX_NEW - RX) * 8 / 1024 ))
    UP=$(( (TX_NEW - TX) * 8 / 1024 ))
    
    # Icon based on signal
    if [ "$SIGNAL" -ge 80 ]; then ICON="󰤨"
    elif [ "$SIGNAL" -ge 60 ]; then ICON="󰤥"
    elif [ "$SIGNAL" -ge 40 ]; then ICON="󰤢"
    elif [ "$SIGNAL" -ge 20 ]; then ICON="󰤟"
    else ICON="󰤯"; fi
    
    # Power save state
    POWER_STATE=$(iw wlp0s20f3 get power_save 2>/dev/null | awk '{print $3}')
    
    if [ "$POWER_STATE" = "off" ]; then
        CLASS="performance"
        MODE="Performance ⚡"
    else
        CLASS="normal"
        MODE="Battery Saver 🔋"
    fi
    
    TOOLTIP="$SSID\nSignal: ${SIGNAL}%\nDown: ${DOWN} Kbps\nUp: ${UP} Kbps\n${IP}\nMode: $MODE"
    
    echo "{\"text\": \"$ICON\", \"class\": \"$CLASS\", \"tooltip\": \"$TOOLTIP\"}"
else
    echo "{\"text\": \"󰖪\", \"class\": \"disconnected\", \"tooltip\": \"Disconnected\"}"
fi