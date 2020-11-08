#!/usr/bin/env bash

DOCKER_BUILDKIT=1 docker build --build-arg USER_UID=`id -u` --build-arg USER_GID=`id -g` --build-arg USER_NAME=`whoami` -t firefox .
