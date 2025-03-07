variable "region1" {
  description = "AWS region where the VPC will be created"
  type        = string
}

variable "region2" {
  description = "AWS region where the VPC will be created"
  type        = string
}

variable "environment1" {
  description = "Environment for the VPC (prod/uat/dev)"
  type        = string
  validation {
    condition     = contains(["prod", "uat", "dev"], var.environment)
    error_message = "Allowed values for environment are 'prod', 'uat', or 'dev'."
  }
}

variable "environment2" {
  description = "Environment for the VPC (prod/uat/dev)"
  type        = string
  validation {
    condition     = contains(["prod", "uat", "dev"], var.environment)
    error_message = "Allowed values for environment are 'prod', 'uat', or 'dev'."
  }
}