provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.latest_amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  security_groups = [aws_security_group.web_sg.name]
  root_block_device {
  iops = 3000
  throughput = 125
  volume_type = "gp3"
}
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
              yum install -y httpd mod_ssl
              systemctl start httpd
              systemctl enable httpd
              sudo yum install certbot python2-certbot-nginx -y  # Amazon Linux 2
              echo "Instance ID: $(curl http://169.254.169.254/latest/meta-data/instance-id)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  Costcode = "0217"
  Owner = "Raghvendra"
  }
metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }
}
