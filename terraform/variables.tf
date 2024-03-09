variable "aws_region" {
  description = "AWS region"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "vpc_name" {
  description = "vpc name"
}

variable "vpc_cidr_block" {
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
    description = "CIDR of each subnet"
    type = list()
    default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "security_group_name" {
  description = "Security group name"
}

variable "security_group_ingress_rules" {
  description = "List of security group ingress rules"
}
