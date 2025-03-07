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
   role_arn = "arn:aws:iam::590183912396:role/testrole2"  # Replace with your IAM role ARN
  }
}

provider "aws" {
  alias = "region1"
  region = var.region1
  assume_role {
   role_arn = "arn:aws:iam::590183912396:role/testrole2"  # Replace with your IAM role ARN
  }
}

provider "aws" {
  alias = "region2"
  region = var.region2
  assume_role {
   role_arn = "arn:aws:iam::590183912396:role/testrole2"  # Replace with your IAM role ARN
  }
}
