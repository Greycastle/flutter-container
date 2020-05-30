FROM ubuntu:18.04

LABEL maintainer="david@greycastle.se"

# Allows us to use --build-args VERSION=# to build containers with specific branches of flutter 
ARG VERSION=master

ENV FLUTTER_PATH=/flutter/bin

WORKDIR /

# Install dependencies
RUN apt-get update &&\
 apt-get install -y lcov git-core curl unzip libglu1 lib32stdc++6

## Install flutter
RUN git clone --branch ${VERSION} --depth=1 https://github.com/flutter/flutter.git &&\
 ${FLUTTER_PATH}/flutter doctor

## Remove unnecessary stuff
RUN apt-get remove -y curl unzip &&\
 apt autoremove -y &&\
 rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:${FLUTTER_PATH}/cache/dart-sdk/bin:${FLUTTER_PATH}