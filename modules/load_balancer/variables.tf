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

variable "vpc_id" {
  description = "vpc id"
}

variable "subnet_ids" {
  description = "subnets id"
}

variable "security_group_id" {
  description = "sg id"
}