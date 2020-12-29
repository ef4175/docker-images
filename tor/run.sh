#!/usr/bin/env bash

USER_NAME=`whoami`
USER_UID=`id -u`
if [ ! -d TorBrowser ]; then
  echo 'First run'
  CONTAINER_ID=`docker run -d tor bash`
  docker cp \
    $CONTAINER_ID:/home/$USER_NAME/tor-browser_en-US/Browser/TorBrowser \
    TorBrowser
  docker rm -f $CONTAINER_ID
fi
mkdir -p downloads
docker run \
  -it \
  -e DISPLAY=$DISPLAY \
  -e PULSE_SERVER=/run/pulse/native \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /run/user/$USER_UID/pulse:/run/pulse \
  -v `pwd`/downloads:/home/$USER_NAME/tor-browser_en-US/Browser/Downloads \
  -v `pwd`/TorBrowser:/home/$USER_NAME/tor-browser_en-US/Browser/TorBrowser \
  --shm-size=2g \
  --rm \
  tor /home/$USER_NAME/tor-browser_en-US/Browser/start-tor-browser --verbose
