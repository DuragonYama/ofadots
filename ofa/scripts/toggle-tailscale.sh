#!/bin/bash

# Function to check if Tailscale is running
is_tailscale_running() {
    systemctl is-active --quiet tailscaled
}

# Function to start Tailscale
start_tailscale() {
    echo "Starting Tailscale..."
    sudo systemctl start tailscaled
    sleep 2  # Wait for service to start
    
    if is_tailscale_running; then
        sudo tailscale up
        notify-send "Tailscale" "Connected to network " -t 2000
        echo "Tailscale started successfully."
    else
        notify-send "Tailscale" "Failed to start " -t 2000
        echo "Failed to start Tailscale."
    fi
}

# Function to stop Tailscale
stop_tailscale() {
    echo "Stopping Tailscale..."
    sudo tailscale down  # Graceful disconnect
    sleep 2  # Wait for disconnect
    sudo systemctl stop tailscaled
    
    if ! is_tailscale_running; then
        notify-send "Tailscale" "Disconnected " -t 2000
        echo "Tailscale stopped successfully."
    else
        notify-send "Tailscale" "Failed to stop " -t 2000
        echo "Failed to stop Tailscale."
    fi
}

# Main toggle logic
if is_tailscale_running; then
    stop_tailscale
else
    start_tailscale
fi
