# AWS Organizational Unit Design

## Objective

Design a scalable AWS Organizations structure that separates security, infrastructure, non-production, production, sandbox, and suspended workloads.

The design supports centralized governance through AWS Control Tower, Service Control Policies, IAM Identity Center, centralized logging, and delegated security administration.

---

## Current Structure

```text
Root
├── Security
│   ├── Audit
│   └── Log Archive
├── Sandbox
└── Management Account