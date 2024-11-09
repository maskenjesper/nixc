#!/usr/bin/env bash

# initializing wallpaper daemon
swww-daemon &
# setting wallpaper
swww img ~/wallpapers/autumn.jpg

# you can install this by adding
# pkgs.networkmanagerapplet to your packages

# clipboard
wl-paste --type text --watch cliphist store # text data
wl-paste --type image --watch cliphist store # image data

hyprpanel

