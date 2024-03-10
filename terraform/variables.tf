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

variable "lb_name" {
  description = "ALB name"
}

variable "tg_name" {
  description = "Target Group name"
}

variable "tg_port" {
  description = "Target Group port"
  default = "80"
}

variable "lt_name" {
}

variable "lt_image_id" {
    description = "EC2 image id" # to make dynamic
}

variable "lt_instance" {
    description = "EC2 instance type"
}


variable "lt_key_name" {
    description = "Key to ssh into the created EC2"
}

variable "asg_name" {
  description = "Auto scaling group name"
}

variable "asg_max" {
  description = "Auto scaling group max size"
  default = 5
}

variable "asg_min" {
  description = "Auto scaling group min size"
  default = 2
}

variable "asg_capacity" {
  description = "Auto scaling group capacity"
  default = 2
}

variable "scale_up_adjust" {
  description = "How many EC2 deploys"
  default = 1
}

variable "scale_up_cooldown" {
  description = "EC2 deploy cooldown"
  default = 300
}

variable "scale_down_adjust" {
  description = "EC2 reduction"
  default = -1
}

variable "scale_down_cooldown" {
  description = "EC2 undeploy cooldown"
  default = 300
}