from openjdk:8u121-jdk

LABEL maintainer "cmacdonald@pbs.org"

ENV DEBIAN_FRONTEND noninteractive

# Haxe environment variables
ENV HAXEURL https://github.com/HaxeFoundation/haxe/releases/download/3.3.0-rc1/haxe-3.3.0-rc.1-linux64.tar.gz
ENV HAXEPATH /root/haxe
ENV HAXE_STD_PATH $HAXEPATH/std/
ENV PATH $HAXEPATH:$PATH

# Neko environment variables
ENV NEKOURL http://nekovm.org/_media/neko-2.0.0-linux64.tar.gz
ENV NEKOPATH /root/neko
ENV LD_LIBRARY_PATH $NEKOPATH
ENV PATH $NEKOPATH:$PATH

# Android SDK environment variables
ENV ANDROIDURL http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
ENV ANDROID_HOME /root/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/build-tools/24.4.1/

COPY bin/setup_node_debian.sh /usr/local/bin/setup_node_debian.sh
COPY bin/build.sh /usr/local/bin/build.sh

RUN /usr/local/bin/build.sh
