# How to setup it?

```
cp ./k3s_conf/database.env.example /k3s_conf/database.env
vagrant up
```

### TODO: setup workers, Nginx networking setup, add image hub


### Usefull commands
```
kubectl get pods
kubectl logs django
docker ps
docker exec -it <id> bash
```

### Restart your pod (1)
```
kubectl get deployments
kubectl get pods
kubectl delete pod django-deployment-696f7647dc-4mpbb
```