# Organizational Unit Design

## Root

The AWS Organizations root is reserved for organization-wide governance. Custom SCPs should be tested on lower-level OUs before being attached to the root.

## Security OU

Contains accounts dedicated to security, compliance, logging, and auditing.

Planned accounts:

- Log Archive
- Audit
- AWS Config Aggregator
- CloudTrail Administrator
- Security Tooling

## Infrastructure OU

Contains shared infrastructure services.

Planned accounts:

- Network
- Shared Services

## NonProduction OU

Contains development and pre-production workloads.

Planned accounts:

- Development
- Testing
- Staging

## Production OU

Contains production workloads.

Planned accounts:

- Production

## Sandbox OU

Contains experimental workloads with restrictive cost, service, and Region controls.

## Suspended OU

Contains quarantined or decommissioning accounts. A restrictive SCP will prevent normal resource activity.
