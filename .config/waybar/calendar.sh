#!/bin/bash

MONTH=$(date +%m)
YEAR=$(date +%Y)


show_calendar() {
    cal -m $MONTH $YEAR | sed 's/^/{"text": "/' | sed 's/$/"},/' | sed '1d' | sed '$d' | tr -d '\n' | sed 's/},/}\\n/g'
}

# Handle scroll events
case $1 in
    up)
        if [ $MONTH -eq 12 ]; then
            MONTH=1
            YEAR=$((YEAR+1))
        else
            MONTH=$((MONTH+1))
        fi
        ;;
    down)
        if [ $MONTH -eq 1 ]; then
            MONTH=12
            YEAR=$((YEAR-1))
        else
            MONTH=$((MONTH-1))
        fi
        ;;
esac

# Output calendar