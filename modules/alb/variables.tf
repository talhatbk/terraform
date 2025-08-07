variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "alb_sg_id" {}
variable "instance1_id" {}
variable "instance2_id" {}
variable "ttl" {
  default = "6h"
}
