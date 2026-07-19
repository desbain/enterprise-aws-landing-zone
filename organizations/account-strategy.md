# AWS Account Strategy

## Implemented Accounts

| Account | OU | Purpose | Status |
|---|---|---|---|
| Management | Root | Organizations, Control Tower, billing, and governance | Active |
| Aggregator/Audit | Security | Centralized AWS Config aggregation and compliance review | Active |
| CloudTrail Administrator/Log Archive | Security | Centralized audit logging | Active |
| Networking | Infrastructure | Central network services and future Transit Gateway | Active |
| Shared-services | Infrastructure | Shared operational and platform services | Provisioning |

## Planned but Deferred

The following workload accounts were not provisioned because the organization reached its current account quota:

- Development
- Testing
- Staging
- Production
- Security Tooling

The corresponding OUs remain available for future expansion.