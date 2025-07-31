provider "aws" {
  region = var.aws_region
}

module "master" {
  source = "./modules/ec2-instance"

  name           = "master"
  instance_type  = var.instance_type
  key_name       = var.key_name
  vpc_id         = var.vpc_id
  subnet_id      = var.subnet_id
  ami_id         = var.ami_id
}

module "worker" {
  source = "./modules/ec2-instance"

  name           = "worker"
  instance_type  = var.instance_type
  key_name       = var.key_name
  vpc_id         = var.vpc_id
  subnet_id      = var.subnet_id
  ami_id         = var.ami_id
}
