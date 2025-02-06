terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  
  assume_role {
   role_arn = "arn:aws:iam::590183912396:role/testrole1"  # Replace with your IAM role ARN
  }
}
