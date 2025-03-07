resource "aws_vpc" "vpc1" {
  cidr_block = "10.10.10.0/24"
  provider = aws.region1

  tags = {
    Name            = "${var.environment1}-vpc"
    "VPC-Environment" = var.environment1
  }
}

resource "aws_vpc" "vpc2" {
  provider = aws.region2
  cidr_block = "10.10.11.0/24"

  tags = {
    Name            = "${var.environment2}-vpc"
    "VPC-Environment" = var.environment2
  }
}
