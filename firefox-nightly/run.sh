#!/usr/bin/env bash

USER_NAME=`whoami`
USER_UID=`id -u`
docker run -it -e DISPLAY=$DISPLAY -e PULSE_SERVER=/run/pulse/native -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/$USER_UID/pulse:/run/pulse --rm firefox-nightly /home/$USER_NAME/firefox/firefox
