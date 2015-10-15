#!/bin/bash

# Define the clock
Clock() {
DATE=$(date "+%A %d %B %Y, %H:%M:%S")

echo -n "$DATE"
}

# Define the battery
Battery() {
BATPERC=$(acpi --battery | cut -d, -f2)
echo "$BATPERC"
}

# Define the volume
Volume () {
mute=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $6}'`
if [[ $mute == off ]]
then echo "--"; else
vol=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $4}'`
if [[ $vol == "0" ]]
then echo "--"; else
echo "$vol"; fi fi
}

# Print the clock

notify-send "$(Battery) $(Volume) $(Clock)"
