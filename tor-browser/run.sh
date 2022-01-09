#!/usr/bin/env bash

USER_NAME=`whoami`
USER_UID=`id -u`
if [ ! -d TorBrowser ]; then
  echo 'First run'
  CONTAINER_ID=`docker run -d tor-browser bash`
  docker cp \
    $CONTAINER_ID:/home/$USER_NAME/tor-browser_en-US/Browser/TorBrowser \
    TorBrowser
  docker rm -f $CONTAINER_ID
fi
mkdir -p downloads
docker run \
  -it \
  --pull never \
  -e DISPLAY=$DISPLAY \
  -e PULSE_SERVER=unix:///run/pulse/native \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /run/user/$USER_UID/pulse:/run/pulse \
  -v `pwd`/downloads:/home/$USER_NAME/tor-browser_en-US/Browser/Downloads \
  -v `pwd`/TorBrowser:/home/$USER_NAME/tor-browser_en-US/Browser/TorBrowser \
  --shm-size=2g \
  --rm \
  tor-browser /home/$USER_NAME/tor-browser_en-US/Browser/start-tor-browser --verbose
