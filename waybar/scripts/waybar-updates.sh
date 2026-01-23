#!/bin/bash

updates=$(checkupdates 2>/dev/null)

if [ -z "$updates" ]; then
    echo '{"text":"0","tooltip":"System is up to date"}'
else
    count=$(echo "$updates" | wc -l)
    packages=$(echo "$updates" | head -20 | awk '{print $1}' | tr '\n' ' ')
    echo "{\"text\":\"$count\",\"tooltip\":\"Updates: $packages\"}"
fi
