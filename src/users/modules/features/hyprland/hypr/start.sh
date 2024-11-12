#!/usr/bin/env bash

dbus-update-activation-environment --systemd --all

systemctl --user start hyprpolkitagent

# clipboard
wl-paste --type text --watch cliphist store # text data
wl-paste --type image --watch cliphist store # image data

# Notification daemon
#mako
# panel
hyprpanel

