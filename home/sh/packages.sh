#!/bin/bash
function i3 () {
  sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa alsa-firmware alsa-lib alsa-plugins lib32-alsa-lib lib32-alsa-plugins lib32-libpulse libcanberra-pulse libpulse lib32-openal openal xorg-server xorg-xinit xorg-server-utils xorg-xprop xterm rxvt-unicode dmenu unzip unrar links mesa ttf-dejavu ttf-droid tamsyn-font xf86-video-intel xf86-input-synaptics ntfs-3g i3-wm i3lock i3status ranger w3m bc dunst libnotify moc faad2 ffmpeg libmpcdec taglib wavpack livestreamer streamripper youtube-dl firefox atool mediainfo acpi htop powertop lm_sensors tlp rsync clamav ufw mp3splt mpv feh lxappearance transmission-remote-cli mupdf zathura-pdf-mupdf libreoffice-fresh scrot calibre dwarffortress rogue nethack stone-soup ttf-liberation ttf-baekmuk ttf-hannom wqy-microhei-lite ttf-freefont ttf-arphic-uming ttf-tibetan-machine ttf-indic-otf ttf-tlwg udisks ntp 
}

function gnome () {
  sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa alsa-firmware alsa-lib alsa-plugins lib32-alsa-lib lib32-alsa-plugins lib32-libpulse libcanberra-pulse libpulse lib32-openal openal xorg-server xorg-xinit xorg-server-utils xorg-xprop mesa ttf-dejavu ttf-droid xf86-video-intel xf86-input-synaptics ntfs-3g libnotify moc faad2 ffmpeg libmpcdec taglib wavpack livestreamer streamripper youtube-dl firefox acpi htop powertop lm_sensors tlp rsync clamav ufw mp3splt mpv transmission-gtk libreoffice-fresh calibre dwarffortress rogue nethack stone-soup ttf-liberation ttf-baekmuk ttf-hannom wqy-microhei-lite ttf-freefont ttf-arphic-uming ttf-tibetan-machine ttf-indic-otf ttf-tlwg ntp gnome
}

if [[ $1 = i3 ]]; then
  echo "Installing packages for i3 Window Manager."
  i3
fi

if [[ $1 = gnome ]]; then
  echo "Installing packages for Gnome Desktop Enviroment."
  gnome
fi
