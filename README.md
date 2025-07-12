
# 🚀 Medusa Backend Deployment using Terraform, AWS ECS (Fargate) & GitHub Actions

This project demonstrates deploying the **Medusa open-source headless commerce backend** to **AWS ECS with Fargate**, fully managed through **Terraform** and automated with **GitHub Actions CI/CD**.

---

## 📚 Table of Contents
- [About Medusa](#about-medusa)
- [Architecture Overview](#architecture-overview)
- [Tech Stack](#tech-stack)
- [Infrastructure Setup](#infrastructure-setup)
- [CI/CD Pipeline](#cicd-pipeline)
- [Step-by-Step Guide](#step-by-step-guide)
- [Accessing the App](#accessing-the-app)
- [Video Demo](#video-demo)
- [Resources](#resources)

---

## 🛒 About Medusa

Medusa is an open-source composable commerce engine built for developers. It enables fast customization and building of scalable ecommerce backends.

Official Docs: https://docs.medusajs.com/

---

## 🏗 Architecture Overview

```
GitHub → GitHub Actions → Docker Hub → AWS ECS (Fargate)
                                 |
                           Terraform Infra
                                 |
                         ECS Cluster + Task
```

---

## 💻 Tech Stack

- 🔧 **Terraform** – Infrastructure as Code
- 🐳 **Docker** – Containerized Medusa Backend
- ☁️ **AWS ECS (Fargate)** – Serverless container hosting
- 🔐 **IAM, VPC, Security Groups** – AWS Services
- 🛠 **GitHub Actions** – CI/CD Pipeline
- 🗂 **ECR or Docker Hub** – Image hosting

---

## ⚙️ Infrastructure Setup (Terraform)

### 🔑 Files Structure
```
terraform/
│
├── main.tf                # Provider, VPC, IAM
├── ecs.tf                 # ECS Cluster, Task, Service
├── variables.tf           # Input variables
├── outputs.tf             # Useful outputs like IP, Task ARN
```

### 🧱 Main Terraform Resources

- `aws_ecs_cluster`
- `aws_ecs_task_definition`
- `aws_ecs_service`
- `aws_iam_role` + `iam:PassRole`
- `aws_security_group`
- `aws_lb` (optional for Load Balancer setup)

---

## 🔄 CI/CD Pipeline (GitHub Actions)

### 📄 `.github/workflows/deploy.yml`

Key Workflow:
1. **Checkout code**
2. **Build Docker image**
3. **Push image to Docker Hub**
4. **Authenticate to AWS**
5. **Update ECS Task Definition**
6. **Force ECS service update**

Secrets used:
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 🧪 Step-by-Step Guide

### ✅ 1. Fork & Clone the Repo

```bash
git clone https://github.com/dhanush-chevuri/Medusa---Deployment-Terraform-and-aws-ECS.git
cd Medusa---Deployment-Terraform-and-aws-ECS
```

### ✅ 2. Set up Terraform CLI

Install Terraform: https://developer.hashicorp.com/terraform/downloads

```bash
terraform init
terraform plan
terraform apply
```

### ✅ 3. Set GitHub Secrets

Go to: `Settings > Secrets and Variables > Actions`

Add:

- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

### ✅ 4. Push to Main Branch

This will trigger the GitHub Actions pipeline:

```bash
git add .
git commit -m "Trigger deployment"
git push origin main
```

The pipeline will:
- Build the Docker image
- Push it to Docker Hub
- Register new ECS Task Definition
- Update ECS Service

---

## 🌐 Accessing the App

After ECS service is deployed and running:

1. Go to AWS Console → ECS → Clusters → `medusa-cluster` → Services → `medusa-service`
2. Click on **running task**
3. Under `Networking`, open the **ENI** and get the **Public IPv4**
4. Access Medusa at:

```bash
http://<public-ip>:7001/store/products
```

> Example: http://13.211.77.110:7001/store/products

---

## 🎥 Video Demo

[📺 Watch full deployment walkthrough with explanation and live ECS output – FACE VISIBLE]

**(Add your Loom / YouTube / Google Drive link here)**

---

## 📚 Resources

- [MedusaJS Docs](https://docs.medusajs.com/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS ECS Documentation](https://docs.aws.amazon.com/ecs/index.html)
- [GitHub Actions Docs](https://docs.github.com/en/actions)

---

## 🙋‍♂️ Author

**Chevuri Chandrasekhar Dhanush**

- GitHub: [@dhanush-chevuri](https://github.com/dhanush-chevuri)
- LinkedIn: [dhanush-chevuri](https://in.linkedin.com/in/dhanush-chevuri-48669a2a3)

---

## 🛡 License

This project is licensed under the MIT License.
