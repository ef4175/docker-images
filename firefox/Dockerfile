FROM debian:buster

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl \
    ca-certificates \
    bzip2 \
    libgtk-3-0 \
    libx11-xcb-dev \
    libdbus-glib-1-dev \
    libxt-dev \
    pulseaudio \
    libcanberra-gtk3-module \
    fonts-wqy-zenhei \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME
WORKDIR /home/$USER_NAME

RUN curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/releases/83.0/linux-x86_64/en-US/firefox-83.0.tar.bz2 \
  && tar -jxf firefox-83.0.tar.bz2 \
  && rm firefox-83.0.tar.bz2
