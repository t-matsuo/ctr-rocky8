#!/bin/bash

which docker > /dev/null 2>&1
if [ $? -ne 0 ]; then
    BUILDER="podman"
fi
echo "building image using $BUIDER"

CC_OPTION="-m"
if [ "$MODE" = "dev" ]; then
    CC_OPTION="-c"
    IS_DEV="-dev"
    sed 's|^RUN|RUN --mount=type=cache,id=rocky8,target=/var/cache/dnf --mount=type=cache,id=rocky8,target=/var/lib/dnf --mount=type=cache,id=rocky8,target=/root/.cache --mount=type=cache,id=rocky8,target=/root/.npm|g' Dockerfile.split > _Dockerfile.split.tmp
else
    sed 's|^#__BULDKIT_MARKER__||g' Dockerfile.split > _Dockerfile.split.tmp
fi

./cocker $CC_OPTION _Dockerfile.split.tmp > _Dockerfile
$BUILDER build -t docker.io/tmatsuo/rocky8 -f _Dockerfile .
