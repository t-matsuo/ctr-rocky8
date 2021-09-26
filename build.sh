#!/bin/bash

./cocker -m Dockerfile.split > _Dockerfile
docker build -t tmatsuo/rockey8 -f _Dockerfile .
