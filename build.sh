#!/bin/bash

./cocker -m Dockerfile.split > _Dockerfile
docker build -t tmatsuo/rocky8 -f _Dockerfile .
