resource "aws_identitystore_group" "cloud_admins" {
  identity_store_id = local.identity_store_id
  display_name      = "CloudAdmins"
  description       = "Administrators responsible for the AWS landing zone"
}

resource "aws_identitystore_group" "developers" {
  identity_store_id = local.identity_store_id
  display_name      = "Developers"
  description       = "Developers with access to AWS development environments"
}

resource "aws_identitystore_group" "security_team" {
  identity_store_id = local.identity_store_id
  display_name      = "SecurityTeam"
  description       = "Security personnel responsible for auditing and monitoring"
}

resource "aws_identitystore_group" "auditors" {
  identity_store_id = local.identity_store_id
  display_name      = "Auditors"
  description       = "Read-only access for governance and compliance reviews"
}
