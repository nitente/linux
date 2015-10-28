#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
# dropbox &

# Execute different WM/DE with "startx ~/.xinitrc name-of-the-wm/de"
# I've also made an alias for eache WM/DE in ~/.zshrc, @i3; @bspwm and @cinnamon

session=${1:-bspwm}
case $session in
  i3    )
    xsetroot -cursor_name left_ptr &
    sleep 5 && dunst &
    xset r rate 200 60 &
    xset m 1/1 4 &
    pulseaudio --start &
    sh $HOME/.fehbg &
    sleep 3 && battery_monitor &
    sleep 3 && $HOME/sh/bstatus.sh &
    sleep 1 && $HOME/sh/touchpad.sh &
    sleep 1 && compton &
    exec i3;;
  bspwm )
    xsetroot -cursor_name left_ptr &
    sleep 5 && dunst &
    xset r rate 200 60 &
    xset m 1/1 4 &
    pulseaudio --start &
    sh $HOME/.fehbg &
    sleep 3 && battery_monitor &
    sleep 3 && $HOME/sh/bstatus.sh &
    sleep 1 && $HOME/sh/touchpad.sh &
    sleep 1 && compton &
    exec sxhkd & bspwm;;
*) exec $1;;
esac

#   xss-lock -- i3lock&
#   xautolock -time 15 -locker "systemctl suspend" &
