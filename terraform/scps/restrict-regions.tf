resource "aws_organizations_policy" "restrict_regions" {
  name        = "RestrictApprovedRegions"
  description = "Restrict regional AWS service usage to approved regions."

  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/restrict-regions.json")
}

resource "aws_organizations_policy_attachment" "restrict_regions" {
  count = var.enable_policy_attachments ? 1 : 0

  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = var.infrastructure_ou_id
}