#!/bin/bash
IFACE="wlp0s20f3"
STATE=$(iw "$IFACE" get power_save | awk '{print $3}')

if [ "$STATE" = "on" ]; then
    sudo iw dev "$IFACE" set power_save off
    notify-send "WiFi Mode" "Performance mode ⚡" -t 2000
else
    sudo iw dev "$IFACE" set power_save on
    notify-send "WiFi Mode" "Battery saver mode 🔋" -t 2000
fi
