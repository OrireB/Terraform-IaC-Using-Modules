# Terraform Infrastructure as Code (IaC) – Using Modules

## Overview

This project demonstrates how to provision infrastructure on AWS using Terraform with a **modular approach**. It is the module representation of my GitHUb repo: 

- [Terraform-IAC](https://github.com/OrireB/Terraform-IAC)

---

## Project Recap:
  
- The project creates an EC2 instance and an S3 bucket. After that, the infrastructure was updated by adding a security group. It covers the following:

- Creating reusable modules
- Provisioning an EC2 instance
- Creating an S3 bucket
- Adding a security group
- Organizing your codebase for clarity and scalability

---

## What Is a Terraform Module?

A **module** is a container for multiple resources that are used together. It’s like a **function in programming**—defined once, and reused with different parameters.

### Benefits

| Without Modules         | With Modules                    |
|------------------------|---------------------------------|
| Repeated code          | Reusable logic                  |
| Difficult to maintain  | Easier updates and management   |
| One large `main.tf`    | Organized by resource type      |
| Not scalable           | Highly scalable and modular     |

---

## How Modules Work

Each module should contain:

- `main.tf`: The actual resource(s)
- `variables.tf`: The inputs for the module
- `outputs.tf`: The values returned to the root module

You use a module in your root `main.tf` like this:

## Module Structure

```
terraform-iac/
├── main.tf              <-- Calls modules
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── ec2/
    │   ├── main.tf          <-- EC2 resource
    │   ├── variables.tf     <-- Input variables
    │   └── outputs.tf       <-- Output from EC2
    ├── s3/
    │   ├── main.tf
    │   └── variables.tf
    │   └── outputs.tf
    └── security_group/
        ├── main.tf
        └── variables.tf
        └── outputs.tf
```

## File Descriptions

- **main.tf** – Calls all resource modules(EC2, S3, Security Group).
[main.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/749583d6d2027ac825dde0c4e3dd7f96694e6987#diff-dc46acf24afd63ef8c556b77c126ccc6e578bc87e3aa09a931f33d9bf2532fbb)

- **provider.tf** – AWS provider and region configuration.
[provider.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/749583d6d2027ac825dde0c4e3dd7f96694e6987#diff-b1ce465309ea8053579092908d4a1eda1a02f48a6287db574dd2a2104935dd2f)

- **variables.tf** – Declares input variables used across the root module(region, AMI, tags, etc.)
[variable.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/749583d6d2027ac825dde0c4e3dd7f96694e6987#diff-ea319dda5a35ac9ff7b01d3483e0ca0cf231d35d8d94a789bab86328aba7cb15)

- **outputs.tf** – Defines output values to display after applying Terraform (e.g., instance IP, S3 bucket name).
[outputs.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/749583d6d2027ac825dde0c4e3dd7f96694e6987#diff-de6c47c2496bd028a84d55ab12d8a4f90174ebfb6544b8b5c7b07a7ee4f27ec7)

- **terraform.tfvars** – Optional: custom variable overrides
[terraform.tfvars](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/749583d6d2027ac825dde0c4e3dd7f96694e6987#diff-ea319dda5a35ac9ff7b01d3483e0ca0cf231d35d8d94a789bab86328aba7cb15)

# modules.tf** – Directory that contains reusable Terraform modules for different AWS resources.  

## module ec2/ – Initial EC2 instance setup

- **main.tf** –  Defines the AWS EC2 instance resource (AMI, instance type, tags, etc.).
[main.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-677655844bc7745b8c9085215751afe5a73658cd5a3e99ca03948bd80a77468f)

- **variables.tf** – Declares input variables specific to the EC2 module (e.g., instance type, AMI ID). |                     
[variable.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-47f507c6ba203fe7152b5aed12d42a73ddb3cceb81c587ea15130b7dc8658589)

- **outputs.tf** – Outputs useful info like the EC2 public IP or instance ID. 
[outputs.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-66d53ea53ed631a1d2b1600f8939115ea3b63a8c9de7bf28d35ce91f8ac1d709)

## module s3/ – S3 bucket configuration

- **main.tf** – Defines the AWS S3 bucket resource and its properties (e.g., tags)
[main.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-0e0c5c95a690c3684d6d9e740ed24a0ade3f5d576e8fc17b59e72509b44f66bb)

- **variables.tf** – Declares variables for the S3 bucket (e.g., name, ACL).
[variable.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-94d43ec3a53e85063024be72fa70e5e71331dda9acd71a3054fd4af700008da2)

- **outputs.tf** – Outputs S3 bucket info (e.g., bucket name or ARN).
[outputs.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-37bc3f43d25a0e195eae84609a0d8765aa43c15a0cf8c06d723bf8b800c02fd0)

## module security_group/ – Defines SSH-enabled security group (added later)

- **main.tf** – Defines the AWS Security Group and its ingress/egress rules.
[main.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-c9008af32302dd0e5c8c77d86c1eca096a3fa829f8d35da6fb98f56150771544)

- **variables.tf** – Declares variables like allowed IPs, ports, and descriptions.
[variable.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-1fd6d8f1b0cd8a626e5b55304ac93593ff20e25b4a860f98a0b68ecf7933376e)

- **outputs.tf** – Outputs Security Group ID or rules.
[outputs.tf](https://github.com/OrireB/Terraform-IaC-Using-Modules/commit/da6f57d18a139b00749aff726d7c1e8562b22514#diff-694494123bad26023d93b01002b29a2bea85e2b6b2282191aa1c7f1939c966b2)

---

## Deployment Steps

From your terminal (inside the project folder), run:
```
terraform init
terraform validate
terraform plan
terraform apply
```

---

## Key Best Practices for Modules
- Keep modules focused (1 resource or task).
- Use descriptive variable names.
- Always output important values.
- Never hardcode values—use variables.
- Version control your modules with Git.
  
---

## Authors
Orire Bankole
DevOps • Cloud • IaC • AWS • Terraform
