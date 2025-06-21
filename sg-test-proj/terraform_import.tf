terraform {
  import {
    to = module.vpc1.aws_security_group.example_sg[0]
    id = sg-00e7ae17e6df07fca
  }
}
