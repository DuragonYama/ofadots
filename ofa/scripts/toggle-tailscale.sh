#!/bin/bash

# Check if tailscaled service is active
if systemctl is-active --quiet tailscaled; then
    # Running - stop it
    sudo systemctl stop tailscaled
    notify-send "Tailscale" "Disconnected" -t 2000
else
    # Stopped - start it
    sudo systemctl start tailscaled
    sleep 1  # Give it a moment to start
    sudo tailscale up
    notify-send "Tailscale" "Connected to network" -t 2000
fi
