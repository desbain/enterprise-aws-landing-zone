variable "aws_region" {
  type = string
}

variable "production_ou_id" {
  type = string
}

variable "security_ou_id" {
  type = string
}

variable "sandbox_ou_id" {
  type = string
}

variable "nonproduction_ou_id" {
  type = string
}

variable "suspended_ou_id" {
  type = string
}

variable "infrastructure_ou_id" {
  type = string
}

variable "enable_policy_attachments" {
  description = "Controls whether SCPs are attached to organizational units."
  type        = bool
  default     = false
}