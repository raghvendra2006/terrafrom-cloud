terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"  # Specify the region where you want to create the bucket
}

cloud {
	organization = "test-learning2006"
	workspace {
		name = "devops-aws-myapp-dev"
	}
}
