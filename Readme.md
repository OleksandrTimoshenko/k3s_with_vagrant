# How to setup it?

```
cp ./k3s_conf/database.env.example /k3s_conf/database.env
cp github.env.example github.env
vagrant up
go to http://127.0.0.1:81
```

## Usefull commands

### Installation and Setup:
```
curl -sfL https://get.k3s.io | sh - - Installs k3s on a Linux machine.
sudo systemctl status k3s - Checks the status of the k3s service.
kubectl get nodes - Lists all the nodes in the cluster.
```

### Cluster Management:
```
kubectl cluster-info - Displays information about the cluster.
kubectl get pods --all-namespaces - Lists all the pods in the cluster.
kubectl get services - Lists all the services in the cluster.
kubectl get deployments - Lists all the deployments in the cluster.
kubectl describe pod <pod_name> - Provides detailed information about a specific pod.
```

### Resource Management:
```
kubectl create -f <yaml_file> - Creates a resource defined in a YAML file.
kubectl apply -f <yaml_file> - Applies changes to a resource defined in a YAML file.
kubectl delete <resource_type> <resource_name> - Deletes a specific resource.
kubectl scale <resource_type> <resource_name> --replicas=<number> - Scales the number of replicas for a resource.
kubectl exec -it <pod_name> -- <command> - Executes a command in a running pod.
```

### Logs and Troubleshooting:
```
kubectl logs <pod_name> - Displays the logs of a specific pod.
kubectl describe <resource_type> <resource_name> - Provides detailed information about a specific resource.
kubectl get events - Lists the events in the cluster, useful for troubleshooting.
kubectl top <resource_type> - Displays CPU and memory usage for resources.
```

### My favorite:
```
kubectl get pods
kubectl logs django
docker ps
docker exec -it <id> bash
kubectl describe pod <pod-name>
```

### Restart your pod
```
kubectl get deployments
kubectl get pods
kubectl delete pod <pod-name>
```

## A few words about networking:

1. ClusterIP: This is the default service type in Kubernetes. It exposes the service on a cluster-internal IP address that is reachable only within the cluster. It's useful for communication between services within the cluster. External traffic cannot directly access a ClusterIP service. This type is suitable when you want to restrict access to the service within the cluster.

2. NodePort: This type exposes the service on a static port on each selected node in the cluster. It creates a ClusterIP service and opens a high-port on every node, which maps to the service. External traffic can access the service by hitting any node's IP address on the defined NodePort. This type is useful when you need to expose the service externally and have a known port for external access.

3. LoadBalancer: This type provisions an external load balancer in the underlying infrastructure (such as a cloud provider) and maps the external IP address to the ClusterIP of the service. It allows external traffic to be load-balanced across multiple replicas of the service. The LoadBalancer type requires a cloud provider that supports external load balancers. It's suitable for scenarios where you need to expose the service to the internet or external clients.

4. ExternalName: This type allows you to create a service that maps to an external DNS name rather than routing traffic to a set of pods. It's useful when you want to provide a service name that is external to the cluster, such as an external database or API.


### TODO: setup workers