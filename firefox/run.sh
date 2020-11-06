#!/usr/bin/env bash

DOCKER_BUILDKIT=1 docker build -t firefox .
docker run -it -e DISPLAY=$DISPLAY -e USER_UID=`id -u` -e USER_GID=`id -g` -e USER_NAME=foobar -e PULSE_SERVER=/run/pulse/native -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/pulse:/run/pulse --rm firefox $@
