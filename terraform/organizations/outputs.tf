output "organization_id" {
  description = "AWS Organization ID"
  value       = data.aws_organizations_organization.current.id
}

output "management_account_id" {
  description = "Management account ID"
  value       = data.aws_organizations_organization.current.master_account_id
}

output "root_id" {
  description = "AWS Organizations root ID"
  value       = data.aws_organizations_organization.current.roots[0].id
}

output "organizational_unit_ids" {
  description = "Organizational unit IDs managed by Terraform"

  value = {
    production     = aws_organizations_organizational_unit.production.id
    security       = aws_organizations_organizational_unit.security.id
    sandbox        = aws_organizations_organizational_unit.sandbox.id
    nonproduction  = aws_organizations_organizational_unit.nonproduction.id
    suspended      = aws_organizations_organizational_unit.suspended.id
    infrastructure = aws_organizations_organizational_unit.infrastructure.id
  }
}

output "accounts" {
  description = "Accounts currently in the AWS Organization"
  value       = data.aws_organizations_organization.current.accounts
}
