variable "region" {
  description = "AWS region where the VPC will be created"
  type        = string
}

variable "environment" {
  description = "Environment for the VPC (prod/uat/dev)"
  type        = string
  validation {
    condition     = contains(["prod", "uat", "dev"], var.environment)
    error_message = "Allowed values for environment are 'prod', 'uat', or 'dev'."
  }
}
