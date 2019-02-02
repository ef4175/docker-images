#!/usr/bin/env bash

docker build -t firefox .
xhost +local:root
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm firefox /firefox/firefox/firefox
