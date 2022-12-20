#!/bin/bash

vncserver -kill :1
rm -rf /tmp/.X11-unix/X0
rm -rf /tmp/.X0-lock
rm -rf /tmp/.X11-unix/X1
rm -rf /tmp/.X1-lock
echo "Running as user: vnc"

vncserver -geometry 1024x768 :1

while true
do
    echo "Running VNC ..."
    sleep 60
done
