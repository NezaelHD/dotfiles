#!/bin/bash

# Get current power profile
current_profile=$(powerprofilesctl get)

# Define output format for Waybar
case $current_profile in
  "performance")
    icon=""  # Performance mode icon
    ;;
  "power-saver")
    icon=""  # Power saver mode icon
    ;;
  "balanced")
    icon=""  # Balanced mode icon
    ;;
  *)
    icon=""  # Default/fallback icon
    ;;
esac

# Display current profile with icon
echo "$icon $current_profile"
