# 🚀 Infrastructure as Code (IaC) with Terraform & Configuration Management using Ansible

Automate AWS infrastructure provisioning with **Terraform** and configure Linux web servers using **Ansible**.

This project demonstrates a complete Infrastructure as Code (IaC) workflow where Terraform provisions AWS EC2 instances and Ansible automatically installs and configures the Apache HTTP Server across multiple managed nodes.

---

## 📌 Project Overview

This project covers the end-to-end automation of infrastructure deployment and server configuration on AWS.

### Infrastructure Provisioning (Terraform)

- Provision AWS EC2 instances
- Configure networking resources
- Deploy a dedicated Ansible Control Node
- Create multiple managed web servers

### Configuration Management (Ansible)

- Configure inventory for multiple hosts
- Establish SSH communication
- Update operating system packages
- Install Apache HTTP Server (httpd)
- Deploy a custom HTML web page
- Start and enable Apache service
- Verify successful deployment

---

# 🏗 Architecture

```

                        Terraform
                             │
                             ▼
                     AWS Infrastructure
                             │
               ┌─────────────┴─────────────┐
               │                           │
               ▼                           ▼
      Ansible Control Node         Managed Nodes
         (Amazon Linux)         ┌───────────────┐
                                │ Web Server 1  │
                                │ Apache HTTPD  │
                                └───────────────┘
                                         │
                                ┌───────────────┐
                                │ Web Server 2  │
                                │ Apache HTTPD  │
                                └───────────────┘

                    SSH over Private IP

```

---
<img width="1536" height="1024" alt="Terraform and Ansible AWS Automation" src="https://github.com/user-attachments/assets/49c25fe7-d53f-4852-999b-17e1cc232726" />

# 📂 Project Structure

```text
.
├── terraform/
│   ├── main.tf
│  

├── ansible/
│   ├── host.ini
│   |── playbook.yml
│   
│
├── architecture/
│
└── README.md
```

---

# ⚙ Technologies Used

- Terraform
- Ansible
- AWS EC2
- Amazon Linux 2023
- Apache HTTP Server
- YAML
- SSH
- Linux
- Infrastructure as Code (IaC)

---

# 📖 Prerequisites

- AWS Account
- Terraform
- Ansible
- AWS CLI
- SSH Key Pair
- Git

---

# 🚀 Deployment Steps

## 1. Clone Repository

```bash
git clone https://github.com/Lahiru-Avishka/terraform-ansible-apache.git

cd terraform-ansible-apache
```

---

## 2. Provision Infrastructure

```bash
cd terraform

terraform init

terraform plan

terraform apply
```

---


## 3. Configure Inventory

Example:

```ini
[webservers]
web1 ansible_host=<Private-IP-1> ansible_user=ec2-user
web2 ansible_host=<Private-IP-2> ansible_user=ec2-user
```

---

## 4. Verify Connectivity

```bash
ansible webservers -i host.ini -m ping
```

Example Output

```text
web1 | SUCCESS
web2 | SUCCESS
```

---

## 5. Deploy Apache

```bash
ansible-playbook -i host.ini apache.yml
```

---

## 6. Verify Deployment

```bash
systemctl status httpd
```

```bash
curl localhost
```

---

# 📄 Sample Playbook Features

✔ Update Packages

✔ Install Apache

✔ Deploy Custom HTML Page

✔ Enable Apache Service

✔ Configure Multiple Servers

✔ Remote Execution over SSH

---

# 📸 Project Screenshots

---

## Terraform Apply

<img width="1917" height="1078" alt="Screenshot 2026-07-30 160149" src="https://github.com/user-attachments/assets/6328fb3d-e15f-44d9-b158-0007d735e7f8" />


## Playbook Execution

<img width="1917" height="1078" alt="Screenshot 2026-07-30 160037" src="https://github.com/user-attachments/assets/8c3282f0-1f32-4839-86e4-7ede3eae4d1b" />


## Apache Running

<img width="1917" height="1078" alt="Screenshot 2026-07-30 155844" src="https://github.com/user-attachments/assets/b48286a6-4159-41fa-9340-16d48d3f8356" />


## Browser Output

<img width="1916" height="1030" alt="Screenshot 2026-07-30 155236" src="https://github.com/user-attachments/assets/cb4979df-970a-4320-ad31-536e86ed58eb" />




# 🎯 Learning Outcomes

- Infrastructure as Code

- Terraform Fundamentals

- Configuration Management

- Remote Automation

- AWS EC2 Administration

- Linux System Administration

- Apache Web Server Deployment

- SSH Authentication

- Multi-Server Automation

- YAML Playbooks

- Idempotent Deployments

---

# 💡 Future Improvements

- Dynamic Inventory

- AWS Load Balancer

- Auto Scaling Group

- Route53

- HTTPS using Let's Encrypt

- Docker Deployment

- CI/CD Pipeline using GitHub Actions

- Monitoring using Prometheus & Grafana



# 📬 Connect With Me

**LinkedIn**

https://www.linkedin.com/in/avilm/



---

## ⭐ If you found this project useful, don't forget to Star the repository!
