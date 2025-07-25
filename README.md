# DevOpsified a Go Web App

This project demonstrates a complete DevOps pipeline and cloud-native deployment workflow using a simple Go web application.

While the application itself is minimal, the focus of this project is on implementing production-grade DevOps practices using the following tools and technologies:

## 🛠️ Tools & Technologies Used

- **Docker** – Containerized the Go web app
- **Kubernetes (K8s)** – Orchestrated containers for scalable deployment
- **Helm** – Managed Kubernetes resources using Helm charts
- **Ingress & Ingress Controller** – Enabled HTTP routing to services inside the cluster
- **AWS EKS** – Deployed and managed the K8s cluster in the cloud
- **CI/CD Pipelines** – Automated testing, building, and deployment (using GitHub Actions or GitLab CI)

## 📦 Key Features

- CI/CD pipeline to build, test, and push Docker images
- Helm chart for managing releases
- Configured Ingress with a controller (e.g., NGINX or AWS ALB)
- Production-ready Kubernetes manifests
- EKS cluster setup and deployment

## 🚀 Purpose

The main purpose of this project is to showcase DevOps practices—not Go development—so the app is intentionally simple to keep the spotlight on:

- Automation
- Deployment strategy
- Infrastructure-as-Code
- Kubernetes and Helm templating
- Observability and maintainability (if extended)

---



# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)


# essentialm CMDs
-- AWS Configure
```
aws configure
```

-- Create EKS Cluster
```
eksctl create cluster --name go-web --region eu-north-1

```
-- Create Deplyment
```
kubectl apply -f k8s/manifest/deployment.yaml
```
-- Create Service
```
kubectl apply -f k8s/manifest/service.yaml
```
-- Create Ingress
```
kubectl apply -f k8s/manifest/ingress.yaml
```
-- View Pods
```
kubectl get pods
```
--Edit Pod [if need to change image tag]
```
kubectl edit pod 'pod name'
```
-- edit Service[change spce.type from ClusterIP to NodePort  ]
```
kubectl edit svc [service name]
```
-- Get Service [after change type you will get port for node ]
```
kubectl get svc
```
-- Get Node IP address
```
kubectl get nodes -o wide
```
# Add rule for securirity group in aws ec2 follwed by node ip[allows IPs keep it 0.0.0.0/0, change service port] 
-- Get Ingress Controller Pod
```
kubectl get pod -n ingress-nginx
```
-- Edit Ingress Controller Pod
```
kubectl edit ingress-nginx-controller-675c4bf49-dwq2b -n ingress-nginx
```
--get ing with controller address[i added ingress controller previously]
```
kubectl get ing
```
--nslookup(name server lookup) is used to query DNS (Domain Name System)[AWS ELASTIC LOAD BALANCER]
```
 nslookup acaca579ac6be4abd882ea2c8150021b-3069110169610036.elb.eu-north-1.amazonaws.com
```
--map a domain with ip in local domain overright file
```
sudo vim /etc/host
mapping =>
13.62.28.90 go-web-app.local
```
