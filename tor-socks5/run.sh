#!/usr/bin/env bash

docker run \
  --interactive \
  --tty \
  --rm \
  --pull never \
  --publish 9050:9050 \
  tor-socks5 tor
# Allows `curl --socks5-hostname 127.0.0.1:9050` on host
# Try `curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org/api/ip`
