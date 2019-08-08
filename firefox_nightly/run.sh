#!/usr/bin/env bash

docker build -t firefox_nightly .
xhost +local:root
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm firefox_nightly /firefox_nightly/firefox/firefox
