terraform {


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_instance" "test1" {
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  key_name          = "tasmiah"
  ami               = "ami-0729e439b6769d6ab"
  tags = {
    Name = "test1"
  }
}


resource "aws_eip" "lb" {
  instance = aws_instance.test1.id
  vpc      = true
}


