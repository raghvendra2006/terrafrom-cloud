terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
   role_arn = "arn:aws:iam::590183912396:role/testrole2"  # Replace with your IAM role ARN
  }
}