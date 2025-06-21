resource "aws_security_group" "example_sg" {
  count       = var.create_security_group ? 1 : 0
  vpc_id      = aws_vpc.main.id
  name        = var.sg_name
  description = "Allow specific ingress traffic"
  lifecycle {
  ignore_changes = [name]
  }

  ingress {
    description = "Allow SSH from 2.2.2.2/32"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["2.2.2.2/32","3.3.3.3/32"]
  }

  ingress {
    description = "Allow port range 23-35 from 1.1.1.1/32"
    from_port   = 23
    to_port     = 35
    protocol    = "tcp"
    cidr_blocks = ["1.1.1.1/32","4.4.4.4/32"]
  }

  ingress {
    description = "Allow SSH from 2.2.2.2/32"
    from_port   = 53
    to_port     = 63
    protocol    = "tcp"
    cidr_blocks = ["2.2.2.2/32","3.3.3.3/32"]
  }

  ingress {
    description = "Allow port range 23-35 from 1.1.1.1/32"
    from_port   = 1023
    to_port     = 2035
    protocol    = "tcp"
    cidr_blocks = ["1.1.1.1/32","4.4.4.4/32"]
  }

  tags = {
    Name = var.sg_name
  }
}
