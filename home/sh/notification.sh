#!/bin/bash

# Define the clock
Clock() {
DATE=$(date "+%m%d %H%M%S")

echo -n "$DATE"
}

# Define the battery
Battery() {
BATPERC=$(acpi --battery | cut -d, -f2)
echo " B:$BATPERC"
}

# Define the volume
Volume () {
mute=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $6}'`
if [[ $mute == off ]]
then echo "--"; else
vol=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $4}'`
if [[ $vol == "0" ]]
then echo "--"; else
echo "V: $vol"; fi fi
}

Net () {
  interface=`cat /proc/net/wireless  | awk 'NR == 3' | awk '{print $1}' | tr -d :`
  essid=`iwconfig | grep $interface | tr -d "\"" | awk '{print $4}' | cut -d : -f 2`
  ip=`ip a | grep $interface | grep inet | awk '{print $2}'| cut -d / -f 1`
  if [[ $essid == off/any ]];then
  echo "W: -- $ip"; else
  echo "W: $essid $ip"
fi
}
# Print the clock

notify-send "$(Net)$(Battery) $(Volume) $(Clock)"
