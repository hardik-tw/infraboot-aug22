# Services

# create a 3 separate terminal split pane with watch on pods
```s
$ watch kubectl get pods -o wide        #00f7ff
$ watch kubectl get svc                 #69f675
$ watch kubectl get endpoints           #ffeb00
```

### ClusterIP [Cluster IP Svc can be used within cluster and use svc cluster ip]

```s
$ $ kubectl apply -f ../04-replicasets/dobby-rs.yaml
$ kubectl apply -f dobby-svc.yaml
$ kubectl describe svc dobbysvc
$ kubectl describe endpoints dobbysvc

# goto node and access pod via service
$ minikube ssh
$ curl 10.98.249.28:4444/meta   //svc cluster ip
# run above command multiple time and observe it connects to different pod IP
$ curl 10.98.249.28:4444/meta
$ curl 10.98.249.28:4444/meta
$ curl 10.98.249.28:4444/meta     //observe output pod IP are different

# to access via DNS name, get inside containers
$ kubectl exec hello-node -it -- sh
$ wget -qO- dobbysvc:4444/meta
$ while true; do sleep 2; wget -qO- "http://dobbysvc:4444/meta"; echo -e '    '$(date);done
$ ping dobbysvc


# delete the rs and observe that pods , eps are not aviable but the service is still the same
$ kubectl delete rs dobby-rs

# increase # of replicas to 3, followed by 4 and upto 6
$ kubectl apply -f ../04-replicasets/dobby-rs.yaml
$ kubectl describe svc dobbysvc
$ kubectl describe endpoints dobbysvc


# goto node and access pod via service - observe the same IP is connecting as ep
$ minikube ssh
$ curl 10.98.249.28:4444/meta   //svc cluster ip

# delete the pod and verify that new pod created with new IP and EP is updated with the new iP for pod
$ kubectl delete pod dobby-rs-**** 
$ minikube ssh
$ curl 10.98.249.28:4444/meta

## so if you add pods, delete pods - your service is not getting impacted




#### Don't run below 2 steps - directly go to NodePort
# access dobby in loop and observe request going to different pods
$ minikube ssh
$ while true; do sleep 2; curl "http://10.10.10.3:30003/meta"; echo -e '    '$(date);done

```

### NodePort [nodeport exposes ep outside the cluster so use the  Node (in our case) minikube IP]
```s
$ kubectl apply -f ../04-replicasets/dobby-rs.yaml
$ kubectl apply -f dobby-svc-nodeport.yaml
$ minikube ip   # vagrant box IP - 10.10.10.2, 10.10.10.3, 10.10.10.4, 10.10.10.5
$ minikube ssh
$ while true; do sleep 2; curl "192.168.49.2:30003/meta"; echo -e '    '$(date);done

```

### Load balancer demo is not included as of now for bootcamp

### LoadBalancer, connect to K8S cluster on Cloud Service provider like Digital Ocean
```s
# connect to AWS cluster --> Use - [KOPS Reference](https://github.com/shpweb/k8s/tree/main/AWS_k8s)
$ kubectl apply -f ../04-replicasets/dobby-rs.yaml
$ kubectl apply -f dobby-svc-lb.yaml
# get ip from Load Balancer (note down external-ip)
$ kubectl get svc 
$ curl a33fb395f1e8e4c6ca29e95a634cadc6-990299649.ap-south-1.elb.amazonaws.com:4444/meta

# same can be run from the web browser 
# also note down the nodeport from get svc command and that nodeport curl will work from local machine with 30324 (or whaterver) port (allow AWS SG)
# don't perform below if no time 


$ while true; do sleep 2; curl "10.10.10.2:4444/meta"; echo -e '    '$(date);done
# run on another node using same port
```
