#!/bin/bash

set -e

echo 'I would like to cut some trees from your jungle.'
echo '🌲🦋🐌🐛🐜🐝'

PATH="/opt/docker-scripts:${PATH}"
cd /tmp/

# Moved to Dokcerfile ARG
#export LC_ALL="C"
#export TERM="xterm"
#export DEBIAN_FRONTEND="noninteractive"
apt-get update
apt-get install -y lsb-release ca-certificates wget gpg jq

echo '🐌 Install PHP 8.2'
echo 'deb https://packages.sury.org/php/ bookworm main' >/etc/apt/sources.list.d/sury-php.list
wget -qO/etc/apt/trusted.gpg.d/sury-php.gpg 'https://packages.sury.org/php/apt.gpg'
printf 'Package: openssl libssl-dev libssl-doc libssl1.1\nPin: origin "packages.sury.org"\nPin-Priority: -1\n' \
    >/etc/apt/preferences.d/sury-openssl.pref
apt-get update
apt-get install -y php8.2-cli php8.2-curl php8.2-mbstring php8.2-xml

echo '🐌 Run some tests'
install-php-phive
phive --no-progress install n98-magerun2 --trust-gpg-keys E92FF862BCBFE89A
find .
./tools/n98-magerun2 --version

echo '🐌 Cleanup'
rm -r /tmp/*
apt-get clean
rm -r /var/lib/apt/lists/*
#du -m /var/*/apt/ /var/lib/dpkg/

echo 'OK.'
