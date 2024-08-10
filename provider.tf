provider "aws" {
  region = "ap-south-1"
  assume_role {
    role_arn = "arn:aws:iam::590183912396:role/terraform-openid"
  }
}
