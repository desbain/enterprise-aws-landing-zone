resource "aws_accessanalyzer_analyzer" "this" {
  analyzer_name = "enterprise-access-analyzer"
  type          = "ACCOUNT"
}