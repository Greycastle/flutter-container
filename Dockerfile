FROM ubuntu:20.04

LABEL maintainer="david@greycastle.se"

# Allows us to use --build-args VERSION=# to build containers with specific branches of flutter
ARG VERSION=master

ENV FLUTTER_PATH=/flutter/bin

WORKDIR /

# Install dependencies
RUN apt-get update &&\
 apt-get install -y lcov git-core curl unzip libglu1 xz-utils

RUN curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${VERSION}-stable.tar.xz -o flutter.tar.gz
RUN apt-get install xz-utils
RUN tar xf flutter.tar.gz
RUN git config --global --add safe.directory /flutter

## Remove unnecessary stuff
RUN apt-get remove -y curl unzip &&\
 apt autoremove -y &&\
 rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:${FLUTTER_PATH}/cache/dart-sdk/bin:${FLUTTER_PATH}