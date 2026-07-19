# AWS Control Tower Deployment

## Objective

Deploy an enterprise AWS landing zone using AWS Control Tower to establish centralized governance, security, identity management, and multi-account best practices.

---

## Environment

| Setting | Value |
|---------|-------|
| Home Region | us-east-2 (Ohio) |
| Additional Governed Region | us-east-1 |
| AWS Organizations | Enabled |
| IAM Identity Center | Enabled |
| Landing Zone | Successfully deployed |

---

## Initial Organizational Structure

Root

- Security OU
- Sandbox OU
- Management Account
- Audit Account
- Log Archive Account

---

## Security Services

- AWS Config enabled
- AWS CloudTrail centralized
- IAM Identity Center integrated
- Control Tower preventive controls enabled

---

## Validation

- Landing Zone deployed successfully
- Security OU registered
- Audit account created
- Log Archive account created
- IAM Identity Center operational

---

## Next Steps

- Create enterprise organizational units
- Configure permission sets
- Implement Service Control Policies
- Provision workload accounts
- Integrate Microsoft Entra ID