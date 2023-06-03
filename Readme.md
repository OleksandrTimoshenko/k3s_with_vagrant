# How to setup it?

```
vagrant up
```

### TODO: setup workers, networking setup, env env variables to Django and Postgresql


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