resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "${terraform.workspace}_ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}
