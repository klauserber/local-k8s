#!/usr/bin/env sh

. ../config

helm repo add portainer https://portainer.github.io/k8s/

gomplate < values.yml | helm upgrade -i portainer portainer/portainer \
  -n portainer \
  --create-namespace \
  --version 1.0.46 \
  --dry-run \
  -f -
