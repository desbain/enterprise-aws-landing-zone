###############################################################
# CloudTrail CloudWatch Logs Assume Role Policy
###############################################################

data "aws_iam_policy_document" "cloudtrail_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

###############################################################
# CloudTrail CloudWatch Logs IAM Role
###############################################################

resource "aws_iam_role" "cloudtrail_cloudwatch" {
  name               = "${local.project}-cloudtrail-cloudwatch-role"
  assume_role_policy = data.aws_iam_policy_document.cloudtrail_assume_role.json
}

###############################################################
# CloudTrail CloudWatch Logs Permissions
###############################################################

data "aws_iam_policy_document" "cloudtrail_cloudwatch" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}:log-stream:*"
    ]
  }
}

###############################################################
# CloudTrail CloudWatch Logs IAM Policy
###############################################################

resource "aws_iam_role_policy" "cloudtrail_cloudwatch" {
  name   = "${local.project}-cloudtrail-cloudwatch-policy"
  role   = aws_iam_role.cloudtrail_cloudwatch.id
  policy = data.aws_iam_policy_document.cloudtrail_cloudwatch.json
}