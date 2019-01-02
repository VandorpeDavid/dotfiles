#!/bin/bash

if pactl info | grep --quiet hdmi
then
    echo disconnect
    pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
else
    pactl set-card-profile 0 output:hdmi-stereo+input:analog-stereo
    echo connect
fi

