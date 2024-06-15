# Personal Finance Tracker

# Project Deployment on Kubernetes Cluster using Jenkins CI/CD Pipeline with Terraform and Ansible

This project sets up an automated CI/CD pipeline using Jenkins, Terraform, AWS, Docker, and Kubernetes. When you commit code to this repository, it triggers the CI pipeline on the Jenkins server, which builds the application, creates a Docker image, and pushes it to Docker Hub. Subsequently, the CD pipeline deploys the application on a Kubernetes cluster.

## Prerequisites

- AWS account
- Terraform installed
- Docker installed
- Jenkins installed
- Kubernetes cluster (Minikube or a cloud provider)
- Git installed

## Steps to Setup

### 1. Clone the Repository

```sh
git clone <repository_url>
cd <repository_name>
```
### 2. Setup Terraform

Terraform scripts are provided to automate the creation of EC2 instances, and the installation of Jenkins and Kubernetes (master and node servers).

#### Initialize Terraform

```sh
terraform init
```

#### Apply Terraform Configuration

```sh
terraform apply
```

Follow the prompts to confirm the action. This will create the necessary EC2 instances and set up Jenkins and Kubernetes.

### 3. Jenkins Configuration

1. Access the Jenkins server using the public IP of the EC2 instance where Jenkins is installed.
2. Install required plugins:
    - Kubernetes plugin
    - Docker plugin
    - Git plugin
3. Configure Jenkins credentials:
    - AWS credentials
    - Docker Hub credentials
4. Set up Jenkins pipeline jobs for CI and CD.

### 4. Create Docker Image and Push to Docker Hub

1. Jenkins CI pipeline will be triggered on code commit.
2. It will build the application and create a Docker image.
3. The image will be tagged and pushed to Docker Hub.

### 5. Deploy Application to Kubernetes

1. Jenkins CD pipeline will be triggered after the Docker image is pushed.
2. It will pull the latest Docker image from Docker Hub.
3. Deploy the application on the Kubernetes cluster using `kubectl`.

### 6. Git Repository Configuration

Ensure your repository has the following structure and scripts:

```
.
├── Jenkinsfile
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── scripts
│       ├── install_jenkins.sh
│       └── install_k8s.sh
├── k8s
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
├── src
│   └── your_application_code
└── Dockerfile
```

### Jenkins file CI and CD Pipeline

### Dockerfile For Building Docker Image

###  Kubernetes YAML Files

#### deployment.yaml

#### service.yaml

#### ingress.yaml


## Conclusion

Following these steps, you will have a fully automated CI/CD pipeline that builds
tests, and deploys your application on a Kubernetes cluster. Ensure to replace placeholders like `<repository_url>`, `your_dockerhub_username`, and `your_repository_name` with actual values specific to your setup.

Jenkins CI Pipeline
![Screenshot 2024-06-16 at 3.23.01 AM.png](..%2FScreenshot%202024-06-16%20at%203.23.01%E2%80%AFAM.png)

Jenkins CD Pipeline
![Screenshot 2024-06-16 at 3.23.32 AM.png](..%2FScreenshot%202024-06-16%20at%203.23.32%E2%80%AFAM.png)












## Table of Contents
- [About](#about)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [Usage](#usage)
- [Authentication](#authentication)
- [Dark and Light Mode](#dark-and-light-mode)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## About

This is a MERN (MongoDB, Express, React, Node.js) Stack web application designed to help you track your personal finances. You can add expenses and income, manage your money, and gain insights from the data. It features JWT authentication for user management and integrates with Google and Facebook for authentication through Firebase. Additionally, it offers dark and light mode options for a customized user experience.

## Features

- User registration and authentication (JWT, Google, Facebook via Firebase)
- Add, edit, and delete expenses and income
- Categorize expenses and income for better organization
- Dashboard for an overview of your financial situation
- Data analysis and visualization for better money management
- Dark and light mode for user preference

## Technologies Used

- MongoDB for database storage
- Express.js for the backend server
- React for the frontend
- Node.js for server-side JavaScript
- JWT for user authentication
- Firebase for Google and Facebook authentication
- Charting libraries for data visualization (e.g., Chart.js)
- TailwindCSS and Styled Components for styling and dark/light mode

## Setup

1. Clone this repository to your local machine.

```bash
git clone https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App.git
```

## Video Demo

https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/7457a4f9-8c0b-4734-99b2-68bc7ae60d88

## Screenshots

-- Getting Started
<img width="1710" alt="Screenshot 2023-10-20 at 2 14 39 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/d6ba0b27-ebb6-4ae7-af31-4211d479cc5f">

-- Loggin Page
<img width="1710" alt="Screenshot 2023-10-20 at 2 14 58 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/1421c620-2ede-4166-b4b1-a33e55f3e85e">


-- SignUp Page
<img width="1710" alt="Screenshot 2023-10-20 at 2 15 12 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/50350eea-4751-4a39-856a-9caecc89c441">


-- Signup with google
<img width="1710" alt="Screenshot 2023-10-20 at 2 15 23 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/aa8dffc0-e3ca-4c52-8179-7d213f3ddfb1">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 53 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/8f913f07-a95f-464a-88c0-379d121347e7">

-- Dashboard
<img width="1710" alt="Screenshot 2023-10-20 at 2 15 40 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/0893706e-c1e7-435d-a5f2-d3dcbc98385b">
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 54 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/2815cc99-54c8-48c5-8018-c5e1358bfd64">

-- Transaction
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 02 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/7880a734-40af-4f18-bd34-6c90098edfa9">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 01 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/5956331e-7bb2-4625-869f-ea672f7c3382">

-- Incomes
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 12 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/a04c98fb-3e13-45d4-b77c-6e29035c0468">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 08 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/19e44704-ba7f-4df7-bb60-f89774a73201">

-- Expenses
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 21 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/3152330d-59cd-4e52-8c94-c32e849a3435">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 15 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/718e1d49-1e34-4eec-afcb-c36059aa7357">

-- Summary
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 29 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/14fb987a-bff9-45ea-9a60-4e9ef4d763e4">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 22 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/f032ce67-fbac-4ff4-b9a2-d20b5ab038d8">

-- History
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 29 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/6556c20d-6fe7-41a7-8cac-faebed67a8e9">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 29 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/2b90a7c3-1ce6-4c11-8a06-0c8d024951aa">


-- Help
<img width="1710" alt="Screenshot 2023-10-20 at 2 16 36 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/35c3cfa9-4cfc-4a7b-9c08-9c77a42d298b">
<img width="1710" alt="Screenshot 2023-10-20 at 2 17 39 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/7114e65f-e507-42fa-90c7-79819d0b7340">

-- Footer
<img width="1710" alt="Screenshot 2023-10-20 at 2 18 07 AM" src="https://github.com/PramithaMJ/Personal_Financial_Tracker_Web_App/assets/123730262/60f89d8e-3cce-4cc9-a4f5-25bcab6a4865">

