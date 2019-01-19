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

RUN curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central/firefox-66.0a1.en-US.linux-x86_64.tar.bz2
RUN tar -jxf firefox-66.0a1.en-US.linux-x86_64.tar.bz2
