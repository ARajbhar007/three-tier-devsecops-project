# 🚀 End-to-End Kubernetes Three-Tier DevSecOps MERN Stack Project

## 📌 Overview

This project demonstrates a **production-grade End-to-End DevSecOps implementation** of a **three-tier MERN (MongoDB, Express/Node.js, React)** application deployed on **AWS EKS** using **GitOps principles**.

The application is a **creative pastel-colored Todo List** designed to showcase frontend aesthetics while the backend infrastructure highlights **automation, security, scalability, and observability**.

The entire lifecycle—from infrastructure provisioning to deployment, security scanning, monitoring, and rollback—is fully automated.

---

## 🎯 Key Objective

* Automate AWS infrastructure provisioning using **Terraform (IaC)**
* Build a secure **CI/CD pipeline using Jenkins**
* Deploy containerized applications on **AWS EKS**
* Implement **GitOps** using **ArgoCD**
* Package applications using **Helm**
* Integrate **DevSecOps security tools**
* Enable **real-time monitoring & alerting**
* Ensure **high availability, scalability, and cost optimization**

---

## 🏗️ High-Level Architecture

**Flow:**

1. Developer pushes code to GitHub
2. Jenkins CI pipeline triggers
3. Code Quality & Security Scans (SonarQube, OWASP, Trivy)
4. Docker images are built and pushed
5. Helm chart values updated in Git repo
6. ArgoCD auto-syncs changes to EKS
7. Application exposed via ALB + Route53 DNS
8. Prometheus & Grafana monitor cluster and app

---

## 🧩 Technology Stack

### ☁️ Cloud & Infrastructure

* AWS (EKS, VPC, IAM, ALB,)
* Terraform

### ⚙️ CI/CD & GitOps

* Jenkins
* GitHub
* ArgoCD
* Helm

### 🐳 Containers & Orchestration

* Docker
* Kubernetes (EKS)

### 🔐 DevSecOps & Security

* SonarQube (Code Quality)
* OWASP Dependency Check
* Trivy (Image Scanning)
* Kubernetes RBAC & Secrets

### 📊 Monitoring & Observability

* Prometheus
* Grafana

### 🧠 Application Stack

* ReactJS (Frontend – Pastel Todo UI)
* Node.js + Express (Backend API)
* MongoDB (Database with Persistent Volume)

---

## 📁 Repository Structure

```
end-to-end-devsecops-mern/
│
├── terraform/               # AWS infrastructure (VPC, EKS, ALB)
├── app/
│   ├── frontend/            # React pastel todo app
│   ├── backend/             # Node.js API
│   └── docker/              # Dockerfiles
│
├── jenkins/
│   └── Jenkinsfile          # CI/CD pipeline
│
├── helm/
│   ├── frontend/
│   ├── backend/
│   └── mongodb/
│
├── argocd/
│   └── application.yaml     # GitOps config
│
└── monitoring/
    ├── prometheus/
    └── grafana/
```

---

## 🎨 Application Features

* Pastel-colored modern UI
* Create and list todos
* REST-based backend API
* Persistent MongoDB storage
* Fully containerized

---

## 🚀 Step-by-Step Implementation Guide

### 1️⃣ Prerequisites

* AWS Account
* Ubuntu/Linux system
* AWS CLI configured
* kubectl, helm, terraform installed
* Docker & Git installed

---

### 2️⃣ Infrastructure Provisioning (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

✔ Creates VPC, Subnets, IAM, EKS Cluster, ALB

---

### 3️⃣ Build & Run MERN App Locally

```bash
cd app/frontend
npm install && npm start

cd app/backend
npm install && node index.js
```

---

### 4️⃣ Dockerize Applications

```bash
docker build -t frontend .
docker build -t backend .
```

---

### 5️⃣ Setup Jenkins CI/CD

* Install Jenkins on EC2 or Kubernetes
* Configure credentials (AWS, Docker, GitHub)
* Create pipeline using `Jenkinsfile`

Pipeline Stages:

* Checkout Code
* SonarQube Scan
* OWASP Dependency Check
* Docker Build & Push
* Trivy Image Scan
* Helm Values Update

---

### 6️⃣ Kubernetes Deployment using Helm

```bash
helm install frontend helm/frontend
helm install backend helm/backend
helm install mongodb helm/mongodb
```

---

### 7️⃣ GitOps with ArgoCD

```bash
kubectl apply -f argocd/application.yaml
```

✔ ArgoCD auto-syncs deployments
✔ Git is the single source of truth

---

### 8️⃣ Monitoring Setup

```bash
helm install monitoring prometheus-community/kube-prometheus-stack
```

* Import Grafana dashboards
* Monitor CPU, memory, pods, API latency

---

### 9️⃣ DNS & ALB

* Configure ALB Ingress Controller
* Create Route53 DNS record pointing to ALB
* Enable HTTPS using ACM

---

## 🔐 Security Best Practices Implemented

* Shift-left security in CI pipeline
* Least-privilege IAM roles
* Kubernetes RBAC
* Secrets via Kubernetes Secrets
* Image vulnerability scanning

---

## 📈 Scalability & Availability

* Kubernetes replicas & auto-scaling
* Load balancing via ALB
* Zero-downtime rolling deployments
* Cost-efficient resource requests & limits

---

## 📊 Monitoring & Alerting

* Prometheus metrics collection
* Grafana dashboards
* Cluster & application observability

---

## 🧪 Highlights

* End-to-End DevSecOps automation
* GitOps-based Kubernetes delivery
* Secure, scalable AWS EKS deployment
* Production-grade CI/CD pipeline

---

## 🏁 Conclusion

This project showcases **real-world DevSecOps practices** used in modern cloud-native organizations, making it ideal for **DevOps / Cloud Engineer portfolios**.

---

## ⭐ If you like this project

Give it a ⭐ and feel free to fork or contribute!

---

## 📬 Author
ASHUTOSH RAJBHAR

**Ashutosh Rajbhar**
DevOps Engineer | Cloud | Kubernetes | DevSecOps
