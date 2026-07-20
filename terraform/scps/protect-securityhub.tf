###############################################################
# Protect AWS Security Hub SCP
###############################################################

resource "aws_organizations_policy" "protect_securityhub" {
  name        = "ProtectSecurityHub"
  description = "Prevent disabling or removing AWS Security Hub."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/protect-securityhub.json")
}

###############################################################
# Attach to Infrastructure OU
###############################################################

resource "aws_organizations_policy_attachment" "protect_securityhub" {
  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.protect_securityhub.id
  target_id = var.infrastructure_ou_id
}