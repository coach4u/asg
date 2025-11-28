module "ec2" {
  source            = "./module/ec2"
  instance_names    = var.instance_names
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  key_name          = var.key_name
  env = var.env
}

output "instance_ids" {
  value = module.ec2.instance_ids
}


