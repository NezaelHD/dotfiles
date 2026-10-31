#!/bin/bash

CALENDAR_CLASS="calendar"

if pgrep -f "waybar.*$CALENDAR_CLASS" > /dev/null; then
    pkill -f "waybar.*$CALENDAR_CLASS"
else
    waybar -c ~/.config/waybar/config-calendar -s ~/.config/waybar/style-calendar.css &
fi
