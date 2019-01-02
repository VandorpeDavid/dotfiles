#!/bin/bash
USER_NAME=$(whoami)
USER_ID=$(id -u "$USER_NAME")
PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

if sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" info | grep --quiet hdmi
then
    echo disconnect
    sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:analog-stereo+input:analog-stereo
else
    sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:hdmi-stereo+input:analog-stereo
    echo connect
fi

