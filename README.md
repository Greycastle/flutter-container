# flutter
Docker container for building flutter.

## dockerhub

The containers are all pushed to dockerhub at [greycastle/flutter](https://hub.docker.com/r/greycastle/flutter).

## build

```bash
docker build .
```

## tag and release

Build master:

```bash
docker build . --tag greycastle/flutter:master
docker push greycastle/flutter:master
```

Build hotfix/version:
```bash
VERSION=1.20.1
docker build . --build-arg VERSION=${VERSION} --tag greycastle/flutter:${VERSION}
docker push greycastle/flutter:${VERSION}
```