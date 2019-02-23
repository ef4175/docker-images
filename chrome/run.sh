#!/usr/bin/env bash

docker build -t chrome .
xhost +local:root
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm chrome google-chrome --no-sandbox
