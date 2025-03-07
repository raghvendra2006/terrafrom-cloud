resource "aws_security_group" "sg1" {
  name        = "${var.environment_prod}-${var.region}-sg"
  description = "Security group for ${var.environment_prod} in ${var.region}"
  vpc_id      = aws_vpc.vpc1.id

# Rule for TCP 443
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.region == "ap-south-1" ? 
      (var.environment == "prod" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
      (var.environment == "prod" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.1/32"])
  }

  # Rule for UDP 3306-3307
  ingress {
    from_port   = 3306
    to_port     = 3307
    protocol    = "udp"
    cidr_blocks = var.region == "ap-south-1" ? 
      (var.environment == "prod" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
      (var.environment == "prod" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.1/32"])
  }
}

resource "aws_security_group" "sg2" {
  name        = "${var.environment_uat}-${var.region}-sg"
  description = "Security group for ${var.environment_uat} in ${var.region}"
  vpc_id      = aws_vpc.vpc1.id

# Rule for TCP 443
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.region == "ap-south-1" ? 
      (var.environment == "prod" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
      (var.environment == "prod" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.1/32"])
  }

  # Rule for UDP 3306-3307
  ingress {
    from_port   = 3306
    to_port     = 3307
    protocol    = "udp"
    cidr_blocks = var.region == "ap-south-1" ? 
      (var.environment == "prod" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
      (var.environment == "prod" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.1/32"])
  }
}
