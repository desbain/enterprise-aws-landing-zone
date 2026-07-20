###############################################################
# Prevent Leaving AWS Organization SCP
###############################################################

resource "aws_organizations_policy" "deny_leaving_org" {

  name        = "DenyLeavingOrganization"
  description = "Prevent member accounts from leaving the AWS Organization."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/deny-leaving-org.json")
}

###############################################################
# Attach SCP
###############################################################

resource "aws_organizations_policy_attachment" "deny_leaving_org" {

  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.deny_leaving_org.id

  target_id = var.infrastructure_ou_id
}
