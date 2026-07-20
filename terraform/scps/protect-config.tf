###############################################################
# Protect AWS Config SCP
###############################################################

resource "aws_organizations_policy" "protect_config" {
  name        = "ProtectAWSConfig"
  description = "Prevent disabling or deleting AWS Config."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/protect-config.json")
}

###############################################################
# Attach to Infrastructure OU
###############################################################

resource "aws_organizations_policy_attachment" "protect_config" {
  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.protect_config.id
  target_id = var.infrastructure_ou_id
}
