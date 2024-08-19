variable "create_security_group" {
  description = "Set to true if you want to create the security group"
  type        = bool
  default     = false
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_security_group" "example_sg" {
  count       = var.create_security_group ? 1 : 0
  vpc_id      = aws_vpc.main.id
  name        = "example-security-group"
  description = "Allow specific ingress traffic"

  ingress {
    description = "Allow SSH from 2.2.2.2/32"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["2.2.2.2/32"]
  }

  ingress {
    description = "Allow port range 23-35 from 1.1.1.1/32"
    from_port   = 23
    to_port     = 35
    protocol    = "tcp"
    cidr_blocks = ["1.1.1.1/32"]
  }

  tags = {
    Name = "example-security-group"
  }
}
