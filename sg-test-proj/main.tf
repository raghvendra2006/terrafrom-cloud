module "vpc1" {
  source    = "./modules/vpc"
  cidr_block = "10.10.10.0/24"
  vpc_name   = "my-main-vpc2"
  create_security_group = "no"
}

module "vpc2" {
  source    = "./modules/vpc"
  cidr_block = "10.10.11.0/24"
  vpc_name   = "my-main-vpc2"
  create_security_group = "no"
}
