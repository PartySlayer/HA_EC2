variable "subnet_cidr_blocks" {
    description = "CIDR of each subnet"
    type = list()
    default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}