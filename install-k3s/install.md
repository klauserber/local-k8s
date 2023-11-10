# Install k3s

-> https://docs.k3s.io/quick-start

## Install k3s

```bash
curl -sfL https://get.k3s.io | sh -s - server --disable=traefik
```

## kubeconfig

    /etc/rancher/k3s/k3s.yaml

Please replace the server IP with your own IP.
