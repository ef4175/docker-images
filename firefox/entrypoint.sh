#!/usr/bin/env bash

groupadd -f -g $USER_GID $USER_NAME
adduser --disabled-login --uid $USER_UID --gid $USER_GID --gecos '' $USER_NAME
sudo -HEu $USER_NAME /firefox/firefox/firefox
