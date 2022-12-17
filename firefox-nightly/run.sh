#!/usr/bin/env bash

mkdir -p cache
mkdir -p mozilla
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
  --mount type=bind,readonly=false,source=$(pwd)/cache,destination=/home/$(whoami)/.cache \
  --mount type=bind,readonly=false,source=$(pwd)/mozilla,destination=/home/$(whoami)/.mozilla \
  --mount type=bind,readonly=false,source=$(pwd)/downloads,destination=/home/$(whoami)/Downloads \
  firefox-nightly /home/$(whoami)/firefox/firefox
