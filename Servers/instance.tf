terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "servers" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  
  name = "servers" 

  count                       = length(var.instance_name_list)
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "binary_aws"
  vpc_security_group_ids      = var.vpc_security_group_ids
  availability_zone           = element(var.availability_zones, count.index)
  associate_public_ip_address = false
  enable_volume_tags          = false
  
  tags = {
    Name    = element(var.instance_name_list, count.index)
    Service = var.service
    Cluster = var.cluster
    Env     = regex("[A-Za-z]+", regex("[A-Za-z0-9]+$", "${element(var.instance_name_list, count.index)}"))  # getting env name from the hostname.
    OS      = var.os
  }

  root_block_device = [{
    volume_type           = "gp3"
    volume_size           = 30
    encrypted             = true
    delete_on_termination = true
    tags = { 
        Name    = element(var.instance_name_list, count.index)
        Service = var.service
        Cluster = var.cluster
        Env     = regex("[A-Za-z]+", regex("[A-Za-z0-9]+$", "${element(var.instance_name_list, count.index)}"))  # getting env name from the hostname.
        OS      = var.os
    }
  }]

}
