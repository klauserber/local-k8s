#!/usr/bin/env sh


helm repo add portainer https://portainer.github.io/k8s/

# https://artifacthub.io/packages/helm/portainer/portainer
gomplate -f values.yml -c config=../config.yml | helm upgrade -i portainer portainer/portainer \
  -n portainer \
  --create-namespace \
  --version 1.0.46 \
  -f -
