FROM debian:buster

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libcanberra-gtk3-module \
    libdbus-glib-1-dev \
    libxt-dev \
    pulseaudio \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME
WORKDIR /home/$USER_NAME

RUN curl -fsSLO --compressed https://www.torproject.org/dist/torbrowser/10.5/tor-browser-linux64-10.5_en-US.tar.xz \
  && tar -xf tor-browser-linux64-10.5_en-US.tar.xz \
  && rm tor-browser-linux64-10.5_en-US.tar.xz
