#!/bin/bash

vncserver -kill :1
rm -rf /tmp/.X11-unix/X0
rm -rf /tmp/.X0-lock
rm -rf /tmp/.X11-unix/X1
rm -rf /tmp/.X1-lock
echo "Running as user: vnc"

# I know, it's not a good practice to run two entrypoint process on the same container,
# but my node application needs to interact with sikulixide that lives on the same container and has a X session.
vncserver -geometry 1024x768 :1

while true
do
    echo "Running VNC ..."
    sleep 60
done
