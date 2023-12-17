#!/bin/bash

which docker > /dev/null 2>&1
if [ $? -ne 0 ]; then
    BUILDER="podman"
fi
echo "building image using $BUIDER"

./cocker -m Dockerfile.split > _Dockerfile
$BUILDER build -t tmatsuo/rocky8 -f _Dockerfile .
