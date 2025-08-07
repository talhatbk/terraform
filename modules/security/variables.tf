variable "vpc_id" {
  description = "VPC ID where SG will be created"
  type        = string
}

variable "sg_name" {
  description = "Security Group name"
  type        = string
  default     = "lab-public-sg"
}

variable "sg_description" {
  description = "Security Group description"
  type        = string
  default     = "Allow SSH and HTTP"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_blocks" {
  description = "CIDR blocks allowed for HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ttl" {
  description = "TTL tag"
  type        = string
  default     = "6h"
}
