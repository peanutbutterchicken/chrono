#!/bin/bash
if pgrep -x "redshift" > /dev/null
then
    killall redshift
    notify-send "Redshift" "Disabled"
else
    # NOTE: Currently using arguments to bypass Ubuntu/Mint AppArmor blocking symlinks.
    # When switching to Arch Linux, delete the line below and uncomment the -c line!
    redshift -l 14.65:121.05 -t 3500:3500 &
    # redshift -c ~/.config/redshift.conf &
    notify-send "Redshift" "Enabled"
fi