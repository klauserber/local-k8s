#!/usr/bin/env bash

. ./VERSION

docker run -it --hostname devbox -p 2080:2080 --rm \
  -v devboxhome:/home/coder \
  -v ${HOME}/.kube/config:/home/coder/.kube/config \
  ${REGISTRY_NAME}/${IMAGE_NAME}:latest
