provider "aws" {
  region = "ap-northeast-3"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}


resource "aws_instance" "My_instances" {
    ami ="ami-0b9bc7dcdbcff394e"
    instance_type = "t2.micro"
    key_name = "balu_apnorteast"
    tags = {
      Name= "Terraform_instance"
      environmet="Terraform"
    }
}