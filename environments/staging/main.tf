terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-staging-environmet-backend1"
    key = "Terraform/terraform.tfstate"
    region ="ap-south-1"
    dynamodb_table = "Terraform-server-backend"   
  }
}

provider "aws" {
    region = "ap-northeast-3"
    # shared_config_files =["/root/.aws/config"]  
    # shared_credentials_files = ["/root/.aws/credentials"]
    # profile = "balu"
}

# Use the EC2 instances module
module "my_instances" {
  source = "./ec2_instance"
  instance_count = var.instance_count
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  subnet_id = module.vpc.public_subnet_2a
  Terraform_sg = module.Terraform_sg.Terraform_sg
}

module "vpc" {
  source              = "./vpc"
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr_1a  = var.public_subnet_cidr_1a
  public_subnet_cidr_2a = var.public_subnet_cidr_2a
  vpc_cidr            = var.vpc_cidr
}