# Docker Basic Commands

Run docker container
```s
$ docker images  
$ docker pull hello-world
$ docker run  hello-world
$ docker ps -a
$ docker logs {containerId}

$ docker pull busybox
$ docker run busybox
$ docker ps -a
$ docker run busybox echo "hello folks..."
$ docker logs {containerId}
$ docker run -it busybox sh
# open another terminal window
$ docker ps -a
$ docker ps
$ watch docker ps # new terminal tab
# kill and show docker watch removes from running containers
```

Run application containers: long running
```s
$ docker run nginx
$ docker run -d nginx --name myweb
$ docker logs {containerId}
$ docker exec -it {containerId} /bin/sh
$ curl -i localhost
$ docker run -p 80:80 --name myweb -d nginx 
$ curl -i localhost
$ docker run -p 81:80 --name myweb2 -d nginx
```

Exercise
```s
$ docker run -p 80:80 -v /Users/sunitp/Projects/rotc-digital/hello-world-nodejs/www:/usr/share/nginx/html:ro --name myweb -d nginx 


```

Special Commands - useful while learning
```s
# stop all stopped running conatiners
$ docker stop $(docker ps -a -q)

# remove all stopped conatiners
$ docker rm $(docker ps -a -q)
```

Run database containers: long running
```s
$ docker run -p 27017:27017 --name mongo -d mongo
$ docker logs -f cb7df003abdb  # new terminal tab
$ mongo
$ docker stop {ontainerId}
$ 
```


Remove all stopped containers
```s
$ docker rm $(docker ps -a -q)
```

Remove all untagged images
```s
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
```




