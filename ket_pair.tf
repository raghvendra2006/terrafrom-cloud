resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.key_name_prefix}-${terraform.workspace}"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/ec2-key.pem"
  sensitive = true

  # Setting permissions for the private key
  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/ec2-key.pem"
  }
}
