# Deployments

# create a 2 separate terminal split pane with watch on pods
```s
$ watch kubectl get pods -o wide
$ kubectl get rs -w
$ watch kubectl get deployment 
$ watch kubectl get ep
```

# Understand problems with just ReplicaSet
```s
# change in replicset
# Node svc resource should be up and running, if not then make it up (../05-services/dobby-svc-np.yaml)
$ kubectl apply -f dobby-rs-env-version.yaml
$ minikube ip 
$ minikube ssh
$ curl "192.168.49.2:4444/version"       //svc cluster IP or pod ip

#check the version in while loop
$ while true; do sleep 1; curl "192.168.49.2:30003/version"; echo -e '    '$(date);done


# Change version in rs and apply again

$ kubectl apply -f dobby-rs-env-version.yaml
$ curl "k8s-master:30003/version"                   //svc cluster IP or pod ip
# observe version

# now delete RS and apply again
$ kubectl delete rs dobby-rs
$ kubectl apply -f dobby-rs-env-version.yaml
$ curl "k8s-master:30003/version"                  //svc cluster IP
# observe version

# delete rs
$ kubectl delete rs dobby-rs
```


# Deploy deployment
```s
$ kubectl apply -f dobby-deployment.yaml
# observe deployment, replicaset and pods - along with our previous service and endpoints getting attached to new pods


$ curl "k8s-master:30003/version"                  //svc cluster IP
# change version to 2.0
$ kubectl apply -f dobby-deployment.yaml
$ curl "k8s-master:30003/version"
# change version to 3.0
$ kubectl apply -f dobby-deployment.yaml
$ curl "k8s-master:30003/version"
``` 

# how to see all revisions of dployment
```s
$ kubectl rollout history deployment/dobby
# notice all 3 revisions deployed so far, however, the field change-cause is empty

# how to set change cause
$ kubectl annotate deployment dobby kubernetes.io/change-cause="my message" --record=false --overwrite=true
$ kubectl rollout history deployment/dobby
$ kubectl rollout history deployment/dobby --revision=3

#Don't run below#
$ export GIT_COMMIT=$(git log -1 --format=%h)
$ kubectl annotate deployment dobby kubernetes.io/change-cause="$GIT_COMMIT" --record=false --overwrite=true
$ kubectl rollout history deployment/dobby

$ kubectl apply -f dobby-deployment-with-annotation.yaml
$ kubectl rollout history deployment/dobby
```

# rollback
```s
$ kubectl rollout undo deployment/dobby
$ kubectl rollout history deployment/dobby
# notice reuse of previous replicaset
$ kubectl rollout undo deployment/dobby --to-revision=1
$ kubectl rollout history deployment/dobby
$ curl "k8s-master:30003/version"

```

# Deployment strategies
```s
# increase no of pods
$ kubectl apply -f dobby-deployment-6-replicas.yaml

# RollingUpdate is default strategy
$ while true; do sleep 1; curl "k8s-master:30003/version"; echo -e '    '$(date);done
$ kubectl apply -f dobby-deployment-rolling-strategy.yaml
# notice slow updates and no downtime, however both version co-exists at given point of time

$ kubectl apply -f dobby-deployment-recreate-strategy.yaml
# notice downtime, all gone and recreated

```
