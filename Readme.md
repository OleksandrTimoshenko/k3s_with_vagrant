# How to setup it?

## Master
```
curl -sfL https://get.k3s.io | sh -
sudo cat /var/lib/rancher/k3s/server/node-token   or   sudo k3s token create
```

### Debug
```
sudo systemctl status k3s.service
sudo journalctl -u k3s
```

## Worker

### error
```
curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.11:6443" K3S_TOKEN="<token>" INSTALL_K3S_EXEC="--node-external-ip 192.168.56.12" sh -s - -- agent
```

# or

### also error
```
curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.11:6443" K3S_TOKEN="<token>" K3S_NODE_NAME="node-1" INSTALL_K3S_EXEC="--with-node-id" sh -s - -- agent
```
### Debug
```
sudo journalctl -u k3s-agent
sudo systemctl status k3s-agent.service
```