FROM debian:buster

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends bzip2
RUN apt-get install -y --no-install-recommends libgtk-3-0
RUN apt-get install -y --no-install-recommends libx11-xcb-dev
RUN apt-get install -y --no-install-recommends libdbus-glib-1-dev
RUN apt-get install -y --no-install-recommends libxt-dev

WORKDIR /firefox

RUN curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/releases/68.0.1/linux-x86_64/en-US/firefox-68.0.1.tar.bz2
RUN tar -jxf firefox-68.0.1.tar.bz2
