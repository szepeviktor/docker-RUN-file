#!/bin/bash

set -e

echo 'I would like to cut some trees from your jungle.'
echo '🌲🦋🐌🐛🐜🐝'

PATH="/opt/docker-scripts:${PATH}"
cd /tmp/

DEBIAN_FRONTEND="noninteractive"
apt-get update
apt-get install -y dialog lsb-release ca-certificates wget jq

install-php-phive
phive install n98-magerun2 --trust-gpg-keys E92FF862BCBFE89A
find .

echo 'OK.'

# Cleanup
rm -r /tmp/*
apt-get clean
rm -r /var/lib/apt/lists/*
