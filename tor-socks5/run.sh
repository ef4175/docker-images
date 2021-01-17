#!/usr/bin/env bash

docker run -it -p 9050:9050 --rm tor-socks5 tor
# Allows `curl --socks5-hostname 127.0.0.1:9050` on host
