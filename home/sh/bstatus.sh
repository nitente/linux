#!/bin/bash
power=$(cat /sys/class/power_supply/BAT0/status)

while true; do
actual=$(cat /sys/class/power_supply/BAT0/status)
if [ $actual != $power ]; then
power=$actual
if [ $actual == unknow ]; then
# the ':' bellow  means to do nothing
  :
else
bb=`echo $actual | awk '{print tolower($0)}'`
notify-send "The battery is $bb." 2>&1 > /dev/null
fi
fi
sleep 10
done
