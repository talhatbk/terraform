variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where instances will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instances"
  type        = string
}
