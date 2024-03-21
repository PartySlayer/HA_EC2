
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-87878787"
    key            = "tf/terraform.tfstate"
    region         = "eu-south-1"
    dynamodb_table = "state-lock"
    
  }
}


provider "aws" {
  region     = var.aws_region
  profile = "default"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  vpc_name           = var.vpc_name
  subnet_cidr_blocks = var.subnet_cidr_blocks
}


module "security_group" {
  source              = "./modules/security_group"
  security_group_name = var.security_group_name
  vpc_id              = module.vpc.vpc_id

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
  source            = "./modules/load_balancer"
  tg_port           = var.tg_port
  tg_name           = var.tg_name
  lb_name           = var.lb_name
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security_group.security_group_id
}

module "launch_template" {
  source            = "./modules/launch_template"
  lt_name           = var.lt_name
  lt_key_name       = var.lt_key_name
  lt_image_id       = var.lt_image_id
  lt_instance       = var.lt_instance
  security_group_id = module.security_group.security_group_id
  
}

module "auto_scaling" {
  source = "./modules/auto_scaling"
  asg_name = var.asg_name
  launch_template_id = module.launch_template.launch_template_id
  target_group_arn = module.load_balancer.target_group_arn
  subnet_ids = module.vpc.subnet_ids
}