# ReplicSet commands


# create a 2 separate terminal split pane with watch on pods
```s
$ watch kubectl get pods -o wide
$ kubectl get rs -w
```

```s
$ kubectl apply -f dobby-rs.yaml
$ kubectl get rs -o wide
# observe CURRENT, DESIRED column along with SELECTOR
$ kubectl get pods -o wide --show-labels
$ kubectl describe rs dobby-rs

# observve the resiliency after deleting one pod
$ kubectl delete pod dobby-rs-*****
# notice new pods spin up immediately


# increase replica count to 6 and apply again
$ kubectl apply -f dobby-rs.yaml
# decrease replica count to 2 and apply again
$ kubectl apply -f dobby-rs.yaml
```

# Pod with Label
```s
$ kubectl get pods --show-lables

# fun part - add Pod with same label (i.e. dobby-pod)
$ kubectl apply -f dobby-with-labels.yaml
# observe that it will create and terminate again because control manager maintain the desired state

# remove label and apply again
$ kubectl apply -f dobby-with-labels.yaml

# Now delete RS (all pods) and create a simple pod with same label 
$ kubectl delete rs dobby-rs
$ kubectl apply -f dobby-with-labels.yaml

#observe that it will create one pod and if you create rs with same label then it creates the desired no of pods
$ kubectl apply -f dobby-rs

#if we delete rs, it will delete all the pods, even the one created as a single pod because rs see the lable 
$ kubectl delete rs dobby-rs

# so it is all about the label and selector for RS and with reconcillaion loop. 

```

# showcase readiness and liveness probes
```s
$ kubectl apply -f dobby-rs-with-probes.yaml
$ minikube ssh
$ curl -i -X PUT http://172.17.0.3:4444/control/ready/sick
$ curl -i -X PUT http://172.17.0.3:4444/control/health/sick
$ curl -i -X PUT http://172.17.0.3:4444/control/ready/perfect

```

