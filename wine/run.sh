#!/usr/bin/env bash

docker run \
  --interactive \
  --tty \
  --rm \
  --pull never \
  --env DISPLAY=$DISPLAY \
  --env PULSE_SERVER=unix:///run/pulse/native \
  --mount type=bind,readonly=false,source=/tmp/.X11-unix,destination=/tmp/.X11-unix \
  --mount type=bind,readonly=false,source=/run/user/$(id -u)/pulse,destination=/run/pulse \
  --mount type=bind,readonly=false,source=$(pwd)/wine,destination=/home/$(whoami)/.wine \
  wine bash
