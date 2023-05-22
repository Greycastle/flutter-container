#!/bin/bash

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

docker build . --build-arg VERSION=${VERSION} --tag greycastle/flutter:${VERSION}
docker push greycastle/flutter:${VERSION}