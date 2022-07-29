# deploy application

$ kubectl apply -f metadata-service.yml

$ kubectl get pods -o wide
$ kubeclt describe pod metadata-app


# get into the node to hit API endpoints
$ minikube ssh 
$ curl -i 172.17.0.3                
$ curl -i 172.17.0.5:8080/health
$ curl -i 172.17.0.5:8080/info

# get into the hello-node pod to hit API endpoints
$ kubectl exec hello-node -it -- sh
$ wget -qO- 172.17.0.5:8080/health
$ wget -qO- 172.17.0.5:8080/info