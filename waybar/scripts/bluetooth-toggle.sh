#!/bin/bash

# Check if Bluetooth is blocked
if rfkill list bluetooth | grep -q "Soft blocked: yes"; then
    # Bluetooth is off, turn it on
    rfkill unblock bluetooth
else
    # Bluetooth is on, turn it off
    rfkill block bluetooth
fi
