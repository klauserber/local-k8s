#!/usr/bin/env sh

helm repo add mongodb https://mongodb.github.io/helm-charts
helm upgrade -i community-operator mongodb/community-operator \
  --namespace nx-cloud \
  --create-namespace

kubectl -n nx-cloud apply -f mongodb.yml

kubectl -n nx-cloud apply -f secret.yml

helm repo add nx-cloud https://nrwl.github.io/nx-cloud-helm

https://artifacthub.io/packages/helm/portainer/portainer
gomplate -f values.yml -c config=../config.yml | helm upgrade -i nx-cloud nx-cloud/nx-cloud \
  -n nx-cloud \
  --create-namespace \
  --version 0.11.5 \
  -f -

gomplate -f ingress.yml -c config=../config.yml | kubectl -n nx-cloud apply -f - 
