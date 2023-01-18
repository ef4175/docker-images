FROM debian:bullseye

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl \
    dirmngr \
    fonts-wqy-zenhei \
    gpg \
    gpg-agent \
    libcanberra-gtk3-module \
    libdbus-glib-1-dev \
    libgtk-3-0 \
    libx11-xcb-dev \
    libxt-dev \
    pulseaudio \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME
WORKDIR /home/$USER_NAME

# ftp.mozilla.org can be used instead of download-installer.cdn.mozilla.net.

RUN gpg --batch --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353 \
  && curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/releases/109.0/linux-x86_64/en-US/firefox-109.0.tar.bz2 \
  && curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/releases/109.0/linux-x86_64/en-US/firefox-109.0.tar.bz2.asc \
  && gpg --batch --verify firefox-109.0.tar.bz2.asc firefox-109.0.tar.bz2 \
  && tar -jxf firefox-109.0.tar.bz2 \
  && rm firefox-109.0.tar.bz2 firefox-109.0.tar.bz2.asc
