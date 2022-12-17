FROM debian:bullseye

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    dirmngr \
    gpg \
    gpg-agent \
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

RUN gpg --batch --recv-keys EF6E286DDA85EA2A4BA7DE684E2C6E8793298290 \
  && curl -fsSLO --compressed https://dist.torproject.org/torbrowser/12.0.1/tor-browser-linux64-12.0.1_ALL.tar.xz \
  && curl -fsSLO --compressed https://dist.torproject.org/torbrowser/12.0.1/tor-browser-linux64-12.0.1_ALL.tar.xz.asc \
  && gpg --batch --verify tor-browser-linux64-12.0.1_ALL.tar.xz.asc tor-browser-linux64-12.0.1_ALL.tar.xz \
  && tar -xf tor-browser-linux64-12.0.1_ALL.tar.xz \
  && rm tor-browser-linux64-12.0.1_ALL.tar.xz tor-browser-linux64-12.0.1_ALL.tar.xz.asc
