#!/usr/bin/env bash

# Command to show all guard nodes:
# for fingerprint in $(cat TorBrowser/Data/Tor/state | grep "confirmed_idx" | cut -d = -f 3 | awk '{print $1}'); do echo "https://metrics.torproject.org/rs.html#details/$fingerprint"; done
# https://tor.stackexchange.com/questions/20653/view-current-set-of-guard-nodes-of-a-certain-client/20655#20655

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
