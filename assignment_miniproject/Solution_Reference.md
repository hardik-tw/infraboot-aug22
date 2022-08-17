


## Milestone-1: Application is running locally

Steps to run it locally
- Ensure you have following packages/tools installed on your machine  
$	Docker, Node, Yarn (brew install yarn)

- Clone the repo
```s
$ git clone https://github.com/swarajspatil158/to-do-app.git
```
-	Go inside the project folder 
```s
$ cd to-do-app
```
-	Install dependencies
```s
$ yarn or yarn install
```
-	Start the development mode
```s
$ yarn start
```

-	Open http://localhost:3000 to view the application in the browser

**Note:** If you are having below issue then do as following steps 
![Saved Photos](https://user-images.githubusercontent.com/92606493/184639718-cb144901-32b9-4ef6-b07d-eb8b78643897.jpeg)


remove the older files and install with fresh packages: 
working solution was with yarn:
- removed /node_modules and yarn.lock file.
- then reinstalled my deleted packages/file using yarn install .
<br>
<br>

## Milestone 2: Containerized application is running locally   
To containerize the application
- Build the application
```s
$ yarn build
```
- Create a Dockerfile in the same directory as build (inside to-do-app dir.)
```s
# 1. base image
FROM nginx:alpine

# 2. copy Build for production
COPY build/ /usr/share/nginx/html/

# 3. expose port 
EXPOSE 80

# 4. Command to run after boot
CMD ["nginx", "-g", "daemon off;"]
```
- Build docker image
```s
$ docker build . -t <name>:<tag>
```
- Run the image
```
$ docker run -p 3001:80 <name>:<tag>
```
- Open http://localhost:3001 to view the application in the browser

<br>
<br>

## Milestone-3: Containerized application is running inside minikube
