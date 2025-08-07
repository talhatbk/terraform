provider "aws" {
  region = var.aws_region
}

module "master" {
  source = "./modules/ec2_instance"

  name          = "master"
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
  ami_id        = var.ami_id
}

module "worker" {
  source = "./modules/ec2_instance"

  name          = "worker"
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
  ami_id        = var.ami_id
}

module "alb" {
  source        = "./modules/alb"
  vpc_id        = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet_ids[0]]
  alb_sg_id     = module.security.sg_id
  instance1_id  = module.worker.instance_id
  instance2_id  = module.master.instance_id
  ttl           = "6h"
}

module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  ttl          = "6h"
  public_subnet_cidrs  = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]
  azs          = ["us-east-1a"]
}

module "security" {
  source           = "./modules/security"
  vpc_id           = module.vpc.vpc_id
  sg_name          = "lab-public-sg"
  ssh_cidr_blocks  = ["0.0.0.0/0"]
  http_cidr_blocks = ["0.0.0.0/0"]
  ttl              = "6h"
}


