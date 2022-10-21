FROM debian:bullseye

ARG USER_UID
ARG USER_GID
ARG USER_NAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gcc \
    gettext \
    less \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    libssl-dev \
    libz-dev \
    make \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSLO --compressed https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.38.1.tar.gz \
  && tar -zxf git-2.38.1.tar.gz \
  && cd git-2.38.1 \
  && make prefix=/usr install \
  && cd .. \
  && rm -rf git-2.38.1*

RUN groupadd -f -g $USER_GID $USER_NAME
RUN adduser --disabled-login --uid $USER_UID --gid $USER_GID --gecos '' $USER_NAME

WORKDIR /home/$USER_NAME/project
