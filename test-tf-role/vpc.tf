resource "aws_vpc" "vpc1" {
  cidr_block = "10.10.10.0/24"

  tags = {
    Name            = "${var.environment}-vpc"
    "VPC-Environment" = var.environment
  }
}

resource "aws_vpc" "vpc2" {
  cidr_block = "10.10.11.0/24"

  tags = {
    Name            = "${var.environment}-vpc"
    "VPC-Environment" = var.environment1
  }
}
