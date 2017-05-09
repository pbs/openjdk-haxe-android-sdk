#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

rm -rf /var/lib/apt/lists/*
/usr/local/bin/setup_node_debian.sh

# lib32stdc++6 because of http://stackoverflow.com/a/23201209
apt-get install -y \
    g++ \
    git \
    imagemagick \
    libgc-dev \
    nodejs \
    wget \
    lib32stdc++6 \
    lib32z1 \
    zip

mkdir -p $NEKOPATH
mkdir -p $HAXEPATH
mkdir -p $ANDROID_HOME

wget -O - $NEKOURL | tar xzf - --strip=1 -C $NEKOPATH
wget -O - $HAXEURL | tar xzf - --strip=1 -C $HAXEPATH
wget -O - $ANDROIDURL | tar xzf - --strip=1 -C $ANDROID_HOME

mkdir /root/haxelib
echo /root/haxelib > /root/.haxelib
cp /root/.haxelib /etc/
haxelib setup /usr/share/haxelib
