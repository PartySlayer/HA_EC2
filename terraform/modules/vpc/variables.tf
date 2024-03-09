variable "vpc_name" {
  description = "vpc name"
}

variable "vpc_cidr_block" {
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "rt_cidr_block" {
  description = "vpc cidr"
  default     = "0.0.0.0/0"
}