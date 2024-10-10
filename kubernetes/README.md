# Setup
`k3s-init-config.yml` - config to initialize k3s cluster
`k3s-config.yml` - config to join the cluster

- Copy `k3s-init-config.yml` to first control plane node and run
```console
curl -sfL https://get.k3s.io | sh -s - server -c /etc/rancher/k3s/config.yaml
```
- Copy `k3s-config.yml` to the next control plane nodes and run
- ```console
curl -sfL https://get.k3s.io | sh -s - server -c /etc/rancher/k3s/config.yaml
```
