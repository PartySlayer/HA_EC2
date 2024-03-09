
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
