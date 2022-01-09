#!/usr/bin/env bash

docker run -it --pull never -p 9050:9050 --rm tor-socks5 tor
# Allows `curl --socks5-hostname 127.0.0.1:9050` on host
# Try `curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org/api/ip`
