#!/bin/sh
# /etc/profile.d/start.sh
if [ -x /usr/local/bin/tb-menu ]; then
    exec /usr/local/bin/tb-menu
fi
