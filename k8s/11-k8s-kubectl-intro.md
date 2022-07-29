# basic version check

```s
$ kubectl version --short
$ kubectl cluster-info
```

# coomands related to kube configs

```s
$ kubectl config view
# show different parts, users, clusters & contexts

$ kubectl config get-contexts
$ kubectl config current-context

```


# kubectl commands to interact with cluster
```s
$ kubectl api-resources
$ kubectl get nodes -o wide
$ kubectl get pods -o wide
$ kubeclt get namespaces
$ kubectl get all --all-namespaces

```