FROM debian:buster

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update
RUN apt-get install -y git

RUN groupadd -f -g $USER_GID $USER_NAME
RUN adduser --disabled-login --uid $USER_UID --gid $USER_GID --gecos '' $USER_NAME

WORKDIR /home/$USER_NAME/project
