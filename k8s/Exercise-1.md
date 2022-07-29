# basic version check

```s
$ kubectl version
$ kubectl version --short
$ kubectl cluster-info
$ kubectl -h 
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

# minikube commands
```s
$ minikube version
$ minikube ip
$ minikube ssh 

## show minikube's docker-env 
$ docker images
$ docker ps

## come out of minikube to show docker-env
$ docker images   //no images as docker not avilalbe 
$ eval $(minikube docker-env)
$ docker images
$ docker ps
