FROM debian:buster

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends fonts-liberation
RUN apt-get install -y --no-install-recommends libappindicator3-1
RUN apt-get install -y --no-install-recommends libasound2
RUN apt-get install -y --no-install-recommends libnspr4
RUN apt-get install -y --no-install-recommends libnss3
RUN apt-get install -y --no-install-recommends libx11-xcb1
RUN apt-get install -y --no-install-recommends libxss1
RUN apt-get install -y --no-install-recommends libxtst6
RUN apt-get install -y --no-install-recommends lsb-release
RUN apt-get install -y --no-install-recommends wget
RUN apt-get install -y --no-install-recommends xdg-utils
RUN apt-get install -y --no-install-recommends sudo
RUN apt-get install -y --no-install-recommends pulseaudio

WORKDIR /chrome

RUN curl -fsSLO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
