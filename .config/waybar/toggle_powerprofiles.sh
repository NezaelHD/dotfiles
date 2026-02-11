#!/bin/bash

# Get current power profile
current_profile=$(powerprofilesctl get)

# Cycle through the power profiles
if [[ "$current_profile" == "performance" ]]; then
  powerprofilesctl set balanced
elif [[ "$current_profile" == "balanced" ]]; then
  powerprofilesctl set power-saver
else
  powerprofilesctl set performance
fi
