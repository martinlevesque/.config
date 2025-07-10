#!/bin/bash

if pgrep -x dbeaver > /dev/null; then
    # Focus existing Firefox window
    wmctrl -xa dbeaver
else
    dbeaver &
fi
