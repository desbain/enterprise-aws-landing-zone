###############################################################
# AWS Region
###############################################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

###############################################################
# Environment
###############################################################

variable "environment" {
  description = "Deployment environment"
  type        = string
}

###############################################################
# Organization CloudTrail Name
###############################################################

variable "trail_name" {
  description = "Organization CloudTrail name"
  type        = string
}