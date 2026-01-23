#!/bin/bash

# Check for any active VPN interfaces (those with UP flag)
vpn_interfaces=$(ip link show | grep -E 'tun[0-9]|tap[0-9]|wg[0-9]|tailscale[0-9]|OfaVPN' | grep 'UP' | awk -F': ' '{print $2}')

if [ -z "$vpn_interfaces" ]; then
    echo '{"text":"OFF","tooltip":"No VPN connected","class":"disconnected"}'
else
    # Count number of VPN interfaces
    count=$(echo "$vpn_interfaces" | wc -l)
    interfaces=$(echo "$vpn_interfaces" | tr '\n' ', ' | sed 's/,$//')
    echo "{\"text\":\"ON\",\"tooltip\":\"VPN Active: $interfaces\",\"class\":\"connected\"}"
fi
