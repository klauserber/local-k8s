#!/usr/bin/env sh

helm repo add mongodb https://mongodb.github.io/helm-charts
helm upgrade -i community-operator mongodb/community-operator \
  --namespace nx-cloud \
  --create-namespace

kubectl -n nx-cloud apply -f mongodb.yml

