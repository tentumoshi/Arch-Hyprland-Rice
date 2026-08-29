#!/bin/bash

STATE="/tmp/hypr-opacity-$USER"
STEP=0.1
MIN=0.2
MAX=1.0

if [[ -f "$STATE" ]]; then
    opacity=$(cat "$STATE")
else
    opacity=1.0
fi

case "$1" in
    decrease)
        opacity=$(awk -v o="$opacity" -v s="$STEP" -v m="$MIN" \
            'BEGIN { o-=s; if(o<m)o=m; printf "%.1f",o }')
        ;;
    increase)
        opacity=$(awk -v o="$opacity" -v s="$STEP" -v m="$MAX" \
            'BEGIN { o+=s; if(o>m)o=m; printf "%.1f",o }')
        ;;
esac

echo "$opacity" > "$STATE"

hyprctl eval "hl.dispatch(hl.dsp.window.set_prop({ prop = \"opacity\", value = \"$opacity\" }))"
