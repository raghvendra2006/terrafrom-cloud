resource "aws_security_group" "main" {
  name        = "${var.environment}-${var.region}-sg"
  description = "Security group for ${var.environment} in ${var.region}"
  vpc_id      = aws_vpc.main.id

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.environment == "prod" ? (
      var.region == "aps1" ? ["10.1.1.1/32", "10.1.2.1/32"] : 
      var.region == "aps2" ? ["11.1.1.1/32", "11.1.2.1/32"] : []
    ) : (
      var.region == "aps1" ? ["10.2.1.1/32", "10.2.2.1/32"] : 
      var.region == "aps2" ? ["11.2.1.1/32", "11.2.2.1/32"] : []
    )
  }

  }
