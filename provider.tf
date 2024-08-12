#provider "aws" {
#  region = "ap-south-1"
#  assume_role {
#    role_arn = "arn:aws:iam::590183912396:role/tfc-role"
#  }
#}

Terraform {
  cloud {
	organization = "test-learning2006"
	workspaces {
  	name = "devops-aws-myapp-dev"
	}
  }
  required_providers {
	aws = {
  	source  = "hashicorp/aws"
  	version = “>= 3.73.0”
	}
}

provider "aws" {
  region = var.aws_region
}
