# Enterprise AWS Multi-Account Landing Zone

A production-inspired **Enterprise AWS Landing Zone** built with **Terraform** that demonstrates secure multi-account AWS architecture, centralized governance, security monitoring, Infrastructure as Code (IaC), and DevSecOps best practices.

---

# Enterprise Architecture

![Enterprise AWS Landing Zone](architecture/enterprise-landing-zone-architecture.png)

---

# Project Overview

This project demonstrates how to build a secure, scalable, and well-governed AWS environment using Infrastructure as Code. The repository follows AWS security best practices by implementing centralized governance, identity management, logging, threat detection, vulnerability management, and backup services.

The project is organized into reusable Terraform modules and validated through GitHub Actions CI.

---

# Key Features

- Multi-Account AWS Landing Zone
- AWS Organizations
- Organizational Units (OUs)
- IAM Identity Center (AWS IAM Identity Center)
- Permission Sets
- Account Assignments
- Service Control Policies (SCPs)
- Organization CloudTrail
- AWS Config
- Amazon GuardDuty
- AWS Security Hub
- IAM Access Analyzer
- Amazon Inspector
- AWS Backup
- Terraform Remote State
- Modular Terraform Architecture
- GitHub Actions Continuous Integration

---

# Architecture

```
                    AWS Organizations
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
 Security OU       Infrastructure OU     Workloads OU
        │                  │                  │
 GuardDuty           Shared Services      Dev Account
 Security Hub        Networking           Test Account
 Inspector           Transit Gateway      Prod Account
 Access Analyzer
```

---

# Repository Structure

```
enterprise-aws-landing-zone/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── architecture/
│   ├── enterprise-landing-zone-architecture.png
│   ├── organizations-design.png
│   ├── security-services.png
│   ├── terraform-module-architecture.png
│   └── github-actions-pipeline.png
│
├── docs/
│
├── terraform/
│   ├── access-analyzer/
│   ├── backup/
│   ├── cloudtrail/
│   ├── config/
│   ├── guardduty/
│   ├── inspector/
│   ├── organizations/
│   ├── permission-sets/
│   ├── scps/
│   └── securityhub/
│
└── README.md
```

---

# Completed Modules

| Module | Status |
|----------|--------|
| AWS Organizations | ✅ Complete |
| Organizational Units | ✅ Complete |
| IAM Identity Center | ✅ Complete |
| Permission Sets | ✅ Complete |
| Account Assignments | ✅ Complete |
| Service Control Policies | ✅ Complete |
| AWS CloudTrail | ✅ Complete |
| AWS Config | ✅ Complete |
| Amazon GuardDuty | ✅ Complete |
| AWS Security Hub | ✅ Complete |
| IAM Access Analyzer | ✅ Complete |
| Amazon Inspector | ✅ Complete |
| AWS Backup | ✅ Complete |
| GitHub Actions CI | ✅ Complete |

---

# Terraform Modules

## Governance

- AWS Organizations
- Organizational Units
- IAM Identity Center
- Permission Sets
- Account Assignments
- Service Control Policies

## Logging & Compliance

- AWS CloudTrail
- AWS Config

## Security

- Amazon GuardDuty
- AWS Security Hub
- IAM Access Analyzer
- Amazon Inspector

## Business Continuity

- AWS Backup

---

# GitHub Actions CI

Every push and pull request automatically performs:

- Terraform Init
- Terraform Format Check
- Terraform Validate

Future enhancements:

- TFLint
- tfsec
- Checkov

---

# Security Services

| Service | Purpose |
|----------|----------|
| CloudTrail | API Activity Logging |
| AWS Config | Configuration Compliance |
| GuardDuty | Threat Detection |
| Security Hub | Security Findings Aggregation |
| Access Analyzer | IAM Access Analysis |
| Amazon Inspector | Vulnerability Management |
| AWS Backup | Centralized Backup Management |

---

# Skills Demonstrated

- AWS Organizations
- Multi-Account Governance
- IAM Identity Center
- Infrastructure as Code (Terraform)
- Security Architecture
- Identity & Access Management
- Cloud Security
- AWS Security Services
- GitHub Actions
- DevSecOps
- Modular Infrastructure Design

---

# Deployment

Clone the repository

```bash
git clone https://github.com/desbain/enterprise-aws-landing-zone.git
```

Navigate to any module

```bash
cd terraform/guardduty
```

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Generate a plan

```bash
terraform plan
```

---

# Future Enhancements

- TFLint Integration
- tfsec Security Scanning
- Checkov Policy Scanning
- AWS Security Lake
- Amazon Detective
- AWS Audit Manager
- Firewall Manager
- Organization-wide delegated administrator configuration
- Automated architecture documentation

---

# Technologies Used

- Terraform
- AWS Organizations
- AWS IAM Identity Center
- Amazon GuardDuty
- AWS Config
- AWS CloudTrail
- AWS Security Hub
- IAM Access Analyzer
- Amazon Inspector
- AWS Backup
- GitHub Actions

---

# Author

**George Awa**

Senior Cybersecurity GRC Specialist | Cloud Security | AWS | Terraform | DevSecOps

LinkedIn: *(Add your LinkedIn profile)*

---

# License

This project is licensed under the MIT License.