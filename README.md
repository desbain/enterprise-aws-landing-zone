# Enterprise AWS Landing Zone

This project documents the design and implementation of an enterprise AWS multi-account environment using:

- AWS Organizations
- AWS Control Tower
- AWS IAM Identity Center
- Microsoft Entra ID
- SAML 2.0 federation
- SCIM 2.0 provisioning
- Service Control Policies
- Permission sets
- Centralized logging and security services
- Terraform
- GitHub Actions

## Project Objectives

- Build a governed AWS multi-account landing zone.
- Separate security, infrastructure, non-production, production, sandbox, and suspended workloads.
- Centralize workforce authentication through Microsoft Entra ID.
- Automatically provision users and groups through SCIM.
- Apply least-privilege access through IAM Identity Center permission sets.
- Enforce organization-wide guardrails through Service Control Policies.
- Centralize CloudTrail, AWS Config, GuardDuty, Security Hub, and Inspector.
- Document and automate the environment using Terraform.

## Current Status

- [x] AWS Organizations created
- [x] IAM Identity Center enabled
- [x] AWS Control Tower deployment started
- [x] Security and Sandbox OUs created
- [x] AWS Config integration selected
- [x] Centralized CloudTrail integration selected
- [ ] Control Tower landing zone healthy
- [ ] Enterprise OUs created
- [ ] Workload accounts provisioned
- [ ] Permission sets created
- [ ] SCPs deployed
- [ ] Microsoft Entra ID configured
- [ ] SAML federation configured
- [ ] SCIM provisioning configured
- [ ] Security services centralized
- [ ] Terraform automation completed

## Proposed OU Structure

```text
Root
├── Security
├── Infrastructure
├── NonProduction
├── Production
├── Sandbox
└── Suspended

Add a security-focused `.gitignore`:

```bash
cat > .gitignore <<'EOF'
# Terraform
.terraform/
*.tfstate
*.tfstate.*
crash.log
crash.*.log
*.tfvars
*.tfvars.json
.terraform.lock.hcl

# Credentials and secrets
.env
.env.*
*.pem
*.key
*.pfx
*.p12
credentials
config
secrets*
*secret*
*token*

# Operating systems
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/
*.swp
*.swo

# Temporary files
tmp/
temp/
*.log

# Screenshots requiring review
screenshots/private/
