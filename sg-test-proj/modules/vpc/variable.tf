variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.10.1.0/24"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "create_security_group" {
  description = "Set to true if you want to create the security group"
  type        = bool
  default     = false
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "example-security-group"
}

variable "region1" {
  description = "The AWS region where the VPC will be created"
  type        = string
  default     = "ap-south-1"
}