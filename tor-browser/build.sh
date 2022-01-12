#!/usr/bin/env bash

docker buildx build \
  --build-arg USER_UID=`id -u` \
  --build-arg USER_GID=`id -g` \
  --build-arg USER_NAME=`whoami` \
  -t tor-browser .
