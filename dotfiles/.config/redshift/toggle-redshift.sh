#!/bin/bash
if pgrep -x "redshift" > /dev/null
then
    killall redshift
    notify-send "Redshift" "Disabled"
else
    redshift -c ~/.config/redshift.conf &
    notify-send "Redshift" "Enabled"
fi