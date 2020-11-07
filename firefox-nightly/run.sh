#!/usr/bin/env bash

USER_NAME=`whoami`
USER_UID=`id -u`
mkdir -p cache
mkdir -p mozilla
mkdir -p downloads
docker run -it -e DISPLAY=$DISPLAY -e PULSE_SERVER=/run/pulse/native -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/$USER_UID/pulse:/run/pulse -v `pwd`/cache:/home/$USER_NAME/.cache -v `pwd`/mozilla:/home/$USER_NAME/.mozilla -v `pwd`/downloads:/home/$USER_NAME/Downloads --rm firefox-nightly /home/$USER_NAME/firefox/firefox
