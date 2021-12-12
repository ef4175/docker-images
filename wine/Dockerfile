FROM debian:bullseye

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gpg \
    gpg-agent \
    pulseaudio \
  && curl -fsSLO https://dl.winehq.org/wine-builds/winehq.key \
  && apt-key add winehq.key \
  && rm winehq.key \
  && echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --install-recommends \
    winehq-devel \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME
WORKDIR /home/$USER_NAME
