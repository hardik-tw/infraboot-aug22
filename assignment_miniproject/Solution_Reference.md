## Milestone-1: Application is running locally

Steps to run Application locally
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
> **Learning / Tech-stack to be used: Docker/ Container**

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
> **Learning / Tech-stack to be used: Kubernetes**

Create k8s manifests for deploy the application on minikube cluster: 
1. kanban-ns.yaml
2. kanban-deployment.yaml
3. kanban-service.yaml

- Test if the Application is working in minikube cluster: 
  - check if the required pods, deployment, service, rs, etc. deployed in given namespace and in ready state. 
  ```s
  $ kubectl get pods -n kanban -o wide
  $ kubectl get deployment -n kanban
  $ kubectl get svc -n kanban -o wide
  $ kubectl get rs -n kanban -o wide
  ```
  - connect to one of the pods and check if application is working 
  ```s
  $ kubectl exec todo-deployment-xxxxxx-yyyyy -n kanban -it sh
  $ curl localhost
  ```
  - Connect the minikube and check if application is working with service endpoint (ClusterIP or NodePort)
  ```s
  $ minikube ssh
  $ curl <ClusterIP of Service endpoint>      OR
  $ curl <minikube IP>:<NodePort>
  ```
  <br>
  <br>

## Milestone-4: Required infrastructure has been set up in AWS  
> **Learning / Tech-stack to be used: Cloud/ AWS & Terraform**

### basic-eks-setup

Creating a basic EKS (managed kubernetes cluster) setup on AWS ****without using any pre-built terraform modules**** for EKS. 
- This cluster is setup on top of a default-vpc (not a secure mechanism, but this is just an overview of EKS setup without touching the network layer)
- There is no terraform remote backend created for this. So terraform state is locally managed as per this repo.

### Steps to setup:
- Setup the laptop with AWS Credentials (either with environment variable or with aws configuration/ credentials)
- Create below mentioned .tf files and put it in a directory [See reference files here](./terraform)
```s
provider.tf
variable.tf
eks_cluter.tf
iam_cluster.tf
iam_node_group.tf
ecr_registry.tf
output.tf
```
- Run `terraform init`
- Run `terraform plan`
- Run `terraform apply`

### Access the EKS cluster

It might take about 20-25 mins for the cluster creation, once the cluster setup is done, perform the following commands

1. Generate Kubeconfig

    ```
    aws eks update-kubeconfig --name <cluster-name>

2. Verify the current cluster context

   ```
   kubectl config current-context

3. Access the cluster resources

    ```
    kubectl get pods -n <namepsace>

<br>
<br>

## Milestone-5: Application is running inside EKS     
> **Learning / Tech-stack to be used: Docker/ Container, K8S, AWS, Terraform**

**Challenge faced:**   
**Challenge-1:** Pods showing 'CrashLoopBackOff' state after deploying the k8s manifest.      
**Troubleshooting steps:**    
