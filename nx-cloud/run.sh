#!/usr/bin/env sh

kubectl -n nx-cloud apply -f secret.yml

helm repo add nx-cloud https://nrwl.github.io/nx-cloud-helm

gomplate -f values.yml -c config=../config.yml | helm upgrade -i nx-cloud nx-cloud/nx-cloud \
  -n nx-cloud \
  --create-namespace \
  --version 0.11.5 \
  -f -

gomplate -f ingress.yml -c config=../config.yml | kubectl -n nx-cloud apply -f -
