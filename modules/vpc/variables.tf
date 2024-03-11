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

variable "subnet_cidr_blocks" {
    description = "CIDR of each subnet"
    type = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}