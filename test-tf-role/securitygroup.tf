resource "aws_security_group" "sg1" {
  name        = "${var.environment}-${var.region}-sg"
  description = "Security group for ${var.environment_prod} in ${var.region}"
  vpc_id      = aws_vpc.vpc1.id

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.environment == "prod" ? 
      (var.region == "aps1" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
      (var.region == "aps1" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.0/32"])
  }

  }

resource "aws_security_group" "sg2" {
  name        = "${var.environment}-${var.region}-sg"
  description = "Security group for ${var.environment_uat} in ${var.region}"
  vpc_id      = aws_vpc.vpc1.id

ingress {
    from_port   = 3306
    to_port     = 3307
    protocol    = "udp"
    cidr_blocks = var.environment == "prod" ? 
      (var.region == "aps1" ? ["10.1.1.1/32", "10.1.2.1/32"] : ["11.1.1.1/32", "11.1.2.1/32"]) :
      (var.region == "aps1" ? ["10.2.1.1/32", "10.2.2.1/32"] : ["11.2.1.1/32", "11.2.2.1/32"])
  }

  }
