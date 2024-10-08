terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
  cloud {
    workspaces {
      name = "devops-aws-myapp-dev"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
