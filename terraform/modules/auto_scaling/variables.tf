variable "asg_name" {
  description = "Auto scaling group name"
}

variable "asg_max" {
  description = "Auto scaling group max size"
  default     = 5
}

variable "asg_min" {
  description = "Auto scaling group min size"
  default     = 2
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
