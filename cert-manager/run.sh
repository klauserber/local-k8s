#!/usr/bin/env sh

helm repo add cert-manager https://charts.jetstack.io
helm upgrade -i cert-manager cert-manager/cert-manager \
  -n cert-manager \
  --create-namespace \
  --version 1.13.0 \
  -f values.yml \
  --wait

gomplate -f ca-secret.yml | kubectl apply -f -

kubectl apply -f cluster-issuer.yml
kubectl apply -f acme-cluster-issuer-staging.yml
kubectl apply -f acme-cluster-issuer.yml

