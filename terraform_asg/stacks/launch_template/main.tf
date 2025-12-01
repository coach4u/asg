terraform {
  backend "s3" {
    bucket = "terraform-state-buc-001"
    region = "us-east-1"
    key    = "launch_template/${var.env}/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

module "launch_template" {
  source = "../../module/launch_template"

  name              = "${var.env}-launch-template"
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  security_group_ids = var.security_group_ids
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  user_data    = var.user_data_file
  env               = var.env
}


output "launch_template_id" {
  value = module.launch_template.launch_template_id
}
