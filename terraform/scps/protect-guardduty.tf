###############################################################
# Protect Amazon GuardDuty SCP
###############################################################

resource "aws_organizations_policy" "protect_guardduty" {
  name        = "ProtectAmazonGuardDuty"
  description = "Prevent disabling or removing Amazon GuardDuty protections."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/protect-guardduty.json")
}

###############################################################
# Attach to Infrastructure OU
###############################################################

resource "aws_organizations_policy_attachment" "protect_guardduty" {
  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.protect_guardduty.id
  target_id = var.infrastructure_ou_id
}