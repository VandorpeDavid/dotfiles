#!/bin/bash
USER_NAME=david
USER_ID=$(id -u "$USER_NAME")
HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status)

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

if [[ $HDMI_STATUS == connected ]]
then
echo connect
   sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:hdmi-stereo+input:analog-stereo
else
	echo disconnect
   sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:analog-stereo+input:analog-stereo
fi

