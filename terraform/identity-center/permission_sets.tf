resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = data.aws_ssoadmin_instances.current.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.administrator.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_ssoadmin_managed_policy_attachment" "readonly" {
  instance_arn       = data.aws_ssoadmin_instances.current.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_ssoadmin_managed_policy_attachment" "security_auditor" {
  instance_arn       = data.aws_ssoadmin_instances.current.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.security_auditor.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_ssoadmin_managed_policy_attachment" "developer" {
  instance_arn       = data.aws_ssoadmin_instances.current.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}