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

module "launch_template" {
  source = "./module/launch_template"

  env           = var.env
  instance_type = var.instance_type
  ami_id        = var.ami_id
  key_name      = var.key_name
}

output "instance_ids" {
  value = module.ec2.instance_ids
}

output "private_ips" {
  value = module.ec2.private_ips
}

output "public_ips" {
  value = module.ec2.public_ips
}
output "public_dns" {
  value = module.ec2.public_dns
}






