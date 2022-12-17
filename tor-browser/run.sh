#!/usr/bin/env bash

# Command to show all guard nodes:
# for fingerprint in $(cat TorBrowser/Data/Tor/state | grep "confirmed_idx" | cut -d = -f 3 | awk '{print $1}'); do echo "https://metrics.torproject.org/rs.html#details/$fingerprint"; done
# https://tor.stackexchange.com/questions/20653/view-current-set-of-guard-nodes-of-a-certain-client/20655#20655

if [ ! -d TorBrowser ]; then
  echo 'First run'
  CONTAINER_ID=$(docker run --detach --pull never tor-browser bash)
  docker cp \
    $CONTAINER_ID:/home/$(whoami)/tor-browser/Browser/TorBrowser \
    TorBrowser
  docker rm -f $CONTAINER_ID
fi
mkdir -p downloads
docker run \
  --interactive \
  --tty \
  --rm \
  --pull never \
  --env DISPLAY=$DISPLAY \
  --env PULSE_SERVER=unix:///run/pulse/native \
  --mount type=bind,readonly=false,source=/tmp/.X11-unix,destination=/tmp/.X11-unix \
  --mount type=bind,readonly=false,source=/run/user/$(id -u)/pulse,destination=/run/pulse \
  --mount type=bind,readonly=false,source=$(pwd)/downloads,destination=/home/$(whoami)/tor-browser/Browser/Downloads \
  --mount type=bind,readonly=false,source=$(pwd)/TorBrowser,destination=/home/$(whoami)/tor-browser/Browser/TorBrowser \
  --shm-size 2GiB \
  tor-browser /home/$(whoami)/tor-browser/Browser/start-tor-browser --verbose
