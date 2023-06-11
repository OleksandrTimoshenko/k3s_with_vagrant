# How to setup it?

```
cp ./k3s_conf/database.env.example /k3s_conf/database.env
cp github.env.example github.env
vagrant up
```

### TODO: setup workers


### Usefull commands
```
kubectl get pods
kubectl logs django
docker ps
docker exec -it <id> bash
kubectl describe pod <pod-name>
```

### Restart your pod (1)
```
kubectl get deployments
kubectl get pods
kubectl delete pod django-deployment-696f7647dc-4mpbb
```