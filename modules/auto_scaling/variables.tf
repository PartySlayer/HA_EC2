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

variable "upscale_threshold" {
  description = "Avarage CPU threshold in order to upscale"
  default = "50"
}

variable "downscale_threshold" {
  description = "Avarage CPU threshold in order to scale down"
  default = "30"
}

variable "launch_template_id" {
    description = "LT id" 
}

variable "target_group_arn" {
    description = "Load balancer arn for tg" 
}

variable "subnet_ids" {
  description = "subnet id"
}