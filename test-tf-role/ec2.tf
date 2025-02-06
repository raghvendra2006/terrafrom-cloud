data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["137112412989"]  # Official Amazon Linux 2 AMIs
}

resource "aws_instance" "example_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-0417f0c5554f6dd3b"  # Hardcoded subnet ID

  tags = {
    Name = "ExampleEC2Instance"
  }
}
