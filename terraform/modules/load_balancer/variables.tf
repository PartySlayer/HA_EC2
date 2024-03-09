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