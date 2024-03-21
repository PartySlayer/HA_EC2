# Provider

aws_region = "eu-south-1"
# Vpc

vpc_name = "HA_vpc"
vpc_cidr_block = "10.0.0.0/16"

#subnet_cidr_blocks = "" automatically fetch

# Security Group

security_group_name = "HA_sg"

# Load Balancer

lb_name = "HAlb"
tg_port = "80"
tg_name = "HAtg"

# Launch Template

lt_name = "HA_lt"
lt_key_name = "HA_ubuntu"
lt_image_id = "ami-019c1e0f36fa08c62"
lt_instance = "t3.micro"

# Auto Scaling Group

asg_name = "HA_sg"
# asg_capacity = 
# asg_min = 
# asg_max = 
# scale_up_adjust = 
# scale_up_cooldown = 
# scale_down_adjust = 
# scale_down_cooldown = 
# upscale_threshold = 
# downscale_threshold = 
