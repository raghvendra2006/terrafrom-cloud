provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.latest_amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
              yum install -y httpd mod_ssl
              systemctl start httpd
              systemctl enable httpd
              echo "Instance ID: $(curl http://169.254.169.254/latest/meta-data/instance-id)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }
}
