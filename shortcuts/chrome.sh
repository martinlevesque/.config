#!/bin/bash

if pgrep -x chrome > /dev/null; then
    # Focus existing Firefox window
    wmctrl -xa google-chrome
else
    # Launch Firefox
    google-chrome &
fi
