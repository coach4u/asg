terraform {
  backend "s3" {
    bucket = "terraform-state-buc-001"
    region = "us-east-1"
    key    = "ec2/${var.env}/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

module "ec2" {
  source = "../../module/ec2"

  instance_names    = var.instance_names
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  key_name          = var.key_name
  env               = var.env
}

output "instance_ids" {
  value = module.ec2.instance_ids
}
