
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  vpc_name           = var.vpc_name
}

module "subnets" {
  source              = "./modules/subnets"
  subnet_cidr_blocks  = [var.subnet_cidr_blocks]
}

module "security_group" {
  source              = "./modules/security_group"
  security_group_name = var.security_group_name

  security_group_ingress_rules = [
    {
      description = "Allow HTTP traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow SSH traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  ]
}

module "load_balancer" {
  source = "./modules/load_balancer"
  tg_name = var.tg_name
  tg_port = var.tg_port
  lb_name = var.lb_name
  
}

module "launch_template" {
  source = "./modules/launch_template"
  lt_name = var.lt_name
  lt_key_name = var.lt_key_name
  lt_image_id = var.lt_image_id
  lt_instance = var.lt_instance
}

module "auto_scaling" {
  source = "./modules/auto_scaling"
  asg_name = var.asg_name
}