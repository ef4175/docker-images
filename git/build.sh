#!/usr/bin/env bash

docker build --build-arg USER_UID=`id -u` --build-arg USER_GID=`id -g` --build-arg USER_NAME=`whoami` -t git .
chmod 755 git
