resource "aws_security_group" "sg1" {
  name        = "${var.environment}-${var.region}-sg"
  #description = "Security group for ${var.environment} in ${var.region}"
  vpc_id      = aws_vpc.vpc1.id

# Rule for TCP 443
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = (
      var.region == "ap-south-1" ? 
        (var.environment == "prod" ? ["10.0.1.0/32", "10.0.1.1/32"] : ["10.0.2.0/32", "10.0.2.1/32"]) :
        (var.environment == "prod" ? ["172.16.1.0/32", "172.16.1.1/32"] : ["172.16.2.0/32", "172.16.2.1/32"])
    )
  }
}
