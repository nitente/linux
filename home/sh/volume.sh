#!/bin/bash

mute=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $6}'`
if [[ $mute == off ]]
  then echo "--"; else
vol=`amixer -M -c 0 get Master | grep Mono: | tr -d '[]' | awk '{print $4}'`
if [[ $vol == "0" ]] 
  then echo "--"; else 
    echo "$vol"; fi fi
