#!/bin/bash

set -e

echo 'I would like to cut some trees from your jungle.'
echo '🌲🦋🐌🐛🐜🐝'

set PATH="/opt/docker-scripts:${PATH}"
cd /tmp/

install-php-phive
phive install n98-magerun2 --trust-gpg-keys E92FF862BCBFE89A
find .

echo 'OK.'

# Cleanup
rm -rf /tmp/*
