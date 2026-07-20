###############################################################
# Protect CloudTrail Service Control Policy
###############################################################

resource "aws_organizations_policy" "protect_cloudtrail" {
  name        = "ProtectCloudTrail"
  description = "Prevent deletion, modification, or disabling of CloudTrail."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/protect-cloudtrail.json")
}

###############################################################
# Protect CloudTrail SCP Attachment
###############################################################

resource "aws_organizations_policy_attachment" "protect_cloudtrail_infrastructure" {
  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.protect_cloudtrail.id
  target_id = var.infrastructure_ou_id
}