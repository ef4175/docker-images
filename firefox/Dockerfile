FROM debian:buster

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends bzip2
RUN apt-get install -y --no-install-recommends libgtk-3-0
RUN apt-get install -y --no-install-recommends libx11-xcb-dev
RUN apt-get install -y --no-install-recommends libdbus-glib-1-dev
RUN apt-get install -y --no-install-recommends libxt-dev
RUN apt-get install -y --no-install-recommends sudo
RUN apt-get install -y --no-install-recommends pulseaudio

WORKDIR /firefox

RUN curl -fsSLO --compressed https://download-installer.cdn.mozilla.net/pub/firefox/releases/72.0.1/linux-x86_64/en-US/firefox-72.0.1.tar.bz2
RUN tar -jxf firefox-72.0.1.tar.bz2

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
