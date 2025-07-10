#!/bin/bash

if pgrep -x firefox-bin > /dev/null; then
    # Focus existing Firefox window
    wmctrl -xa firefox
else
    # Launch Firefox
    firefox &
fi
