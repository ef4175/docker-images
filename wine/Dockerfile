FROM debian:bullseye AS curl

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
  && rm -rf /var/lib/apt/lists/*

FROM curl AS wine-i386

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libasound2:i386 \
    libfaudio0:i386 \
    libgphoto2-6:i386 \
    liblcms2-2:i386 \
    libmpg123-0:i386 \
    libopenal1:i386 \
    libpcap0.8:i386 \
    libvkd3d1:i386 \
    ocl-icd-libopencl1:i386 \
    libasound2-plugins:i386 \
    libncurses6:i386 \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-i386/wine-stable-i386_6.0.2~bullseye-1_i386.deb \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-i386/wine-stable_6.0.2~bullseye-1_i386.deb \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-i386/winehq-stable_6.0.2~bullseye-1_i386.deb \
  && dpkg -i \
    wine-stable-i386_6.0.2~bullseye-1_i386.deb \
    wine-stable_6.0.2~bullseye-1_i386.deb \
    winehq-stable_6.0.2~bullseye-1_i386.deb \
  && rm \
    wine-stable-i386_6.0.2~bullseye-1_i386.deb \
    wine-stable_6.0.2~bullseye-1_i386.deb \
    winehq-stable_6.0.2~bullseye-1_i386.deb \
  && rm -rf /var/lib/apt/lists/*

FROM wine-i386 AS wine-amd64

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libasound2 \
    libfaudio0 \
    libgphoto2-6 \
    liblcms2-2 \
    libmpg123-0 \
    libopenal1 \
    libpcap0.8 \
    libvkd3d1 \
    ocl-icd-libopencl1 \
    libasound2-plugins \
    libncurses6 \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-amd64/wine-stable-amd64_6.0.2~bullseye-1_amd64.deb \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-amd64/wine-stable_6.0.2~bullseye-1_amd64.deb \
  && curl -fsSLO https://dl.winehq.org/wine-builds/debian/dists/bullseye/main/binary-amd64/winehq-stable_6.0.2~bullseye-1_amd64.deb \
  && dpkg -i \
    wine-stable-amd64_6.0.2~bullseye-1_amd64.deb \
    wine-stable_6.0.2~bullseye-1_amd64.deb \
    winehq-stable_6.0.2~bullseye-1_amd64.deb \
  && rm \
    wine-stable-amd64_6.0.2~bullseye-1_amd64.deb \
    wine-stable_6.0.2~bullseye-1_amd64.deb \
    winehq-stable_6.0.2~bullseye-1_amd64.deb \
  && rm -rf /var/lib/apt/lists/*

FROM wine-amd64 AS wine-gl

# Needed to prevent Gr2D_DX8: Direct8.1 initialization failed
# 0024:err:wgl:init_opengl Failed to load libGL: libGL.so.1: cannot open shared object file: No such file or directory
# 0024:err:wgl:init_opengl OpenGL support is disabled.
# Otherwise, apt-get install -y --install-recommends (instead of --no-install-recommends) winehq-devel if a larger docker image isn't a deal-breaker

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libgl1:i386 \
  && rm -rf /var/lib/apt/lists/*

FROM wine-gl AS wine-gl-patch-audio-no-large-address-space-aware

# Sound doesn't work without this
# See https://github.com/webanck/docker-wine-steam/issues/12#issuecomment-340245164
# However, this stage can be skipped if "large address space aware" PE flag is set on the client binary
RUN sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

FROM wine-gl AS non-root

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME

USER $USER_NAME
WORKDIR /home/$USER_NAME
