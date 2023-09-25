# local development cluster

A short way to get a local kubernetes development cluster up and running on a local machine with Docker Desktop and expose apps to the internet for testing purposes.

Do **not** clone this repo now. We do this later in the devbox container.

## Architecture

![architecture](./architecture.drawio.svg)

## Prerequisites

- Docker Desktop: https://www.docker.com/products/docker-desktop/

## Start the devbox container

```bash
docker run -it --hostname devbox -p 2080:2080 --rm \
  -v devboxhome:/home/coder \
  -v ${HOME}/.kube/config:/home/coder/.kube/config \
  isi006/localcluster-devbox:latest
```
Visit http://localhost:2080/ to access the devbox IDE.

## Activate Kubernetes on Docker Desktop

-> Docker Desktop -> Preferences -> Kubernetes -> Enable Kubernetes

check if it works:

```bash
kubectl cluster-info
```

- kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/
- helm: https://helm.sh/docs/using_helm/#installing-helm

optional:

- Lens: https://k8slens.dev/


## Minimal infrastructure setup

### configure

```bash
cp config-template config
```

Edit the config file to choose your domain suffix to build unique localtunnel subdomains.

### install ingress-nginx

-> https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx

```bash
cd ingress-nginx
./up.sh
```

check if it works:

```bash
kubectl get all -n ingress-nginx
```

## Install hello-app

```bash
cd hello-app
./up.sh
```

check if it works:

```bash
kubectl get all -n hello-app
```
