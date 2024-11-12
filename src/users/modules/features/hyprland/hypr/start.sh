#!/usr/bin/env bash

# clipboard
wl-paste --type text --watch cliphist store # text data
wl-paste --type image --watch cliphist store # image data

hyprpanel &


