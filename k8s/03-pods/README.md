# Pod commands

## Pod basic commands

create a separate terminal split pane with watch on pods
```s
$ watch kubectl get pods -o wide
```

### Applicaiton overview
1. Nginx                
2. Hello World NodeJS   (one that we used during Docker module)
3. Dobby                (built by TW Chennai team, Krishana and others- check the endpoints like health, meta, version,eetc. written in go; https://github.com/thecasualcoder/dobby)

```s
$ kubectl config get-contexts
$ kubectl get pods

$ kubectl apply -f nginx.yaml
$ kubectl describe pod niginx

$ kubectl apply -f hello-node.yaml
$ kubectl apply -f dobby.yaml


$ kubectl get pods -o wide
$ kubeclt describe pod dobby
$ kubectl logs dobby


# get into the node to hit API endpoints
$ minikube ssh 
$ curl -i 172.17.0.3                //nginx web page
$ curl -i 172.17.0.5:4444/health
$ curl -i 172.17.0.5:4444/meta

# get into the hello-node pod to hit API endpoints
$ kubectl exec hello-node -it -- sh
$ wget -qO- 172.17.0.5:4444/health
$ wget -qO- 172.17.0.5:4444/meta
$ wget -qO- 172.17.0.5:4444/version

# Now lets make changes with ENV variable and see the change in container (we have to delete existing dobby pod as same name)
$ kubectl delete pod dobby

# add ENV variable to POD and see the change
$ kubectl apply -f dobby-with-version.yaml
$ kubectl exec dobby -it -- bash
    $ echo $VERSION
