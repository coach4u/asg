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

  # module inputs (must match module/launch_template/variables.tf)
  name               = var.name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_ids = var.security_group_ids
  subnet_id          = var.subnet_id
  user_data          = fileexists(var.user_data_file) && var.user_data_file != "" ? file(var.user_data_file) : ""
  key_name           = var.key_name
}

output "launch_template_id" {
  value = module.launch_template.launch_template_id
}
