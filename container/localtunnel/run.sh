#!/usr/bin/env bash

. ./VERSION

docker run -it --rm ${REGISTRY_NAME}/${IMAGE_NAME}:latest $@
