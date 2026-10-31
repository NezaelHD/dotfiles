#!/bin/bash

# Get the number of pending notifications
pending=$(swaync-client -n)

# Display the number of notifications or an icon if there are none
if [ "$pending" -gt 0 ]; then
    echo "📬 $pending"
else
    echo "📬 0"
fi
