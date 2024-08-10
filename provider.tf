provider "aws" {
  region = "ap-south-1"
  assume_role {
    role_arn = var.TFC_AWS_RUN_ROLE_ARN
  }
}
