provider "aws" {
  region = var.region
}

# Launch Template module
module "launch_template" {
  source             = "../../terraform_asg/module/launch_template"
  name               = "dev"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_ids = var.instance_security_groups
  subnet_id          = var.subnets[0]   # optional, if LT needs one subnet
  user_data          = var.user_data
  key_name           = var.key_name
  env                = "dev"
}

# ALB module
module "alb" {
  source          = "../../terraform_asg/module/alb"
  env             = "dev"
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  security_groups = var.alb_security_groups
}

# ASG module
module "asg" {
  source                 = "../../terraform_asg/module/asg"
  name                   = "dev"
  launch_template_id     = module.launch_template.launch_template_id
  launch_template_version = module.launch_template.launch_template_latest_version
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  subnet_ids             = var.subnets
  alb_target_group_arn   = module.alb.alb_target_group_arn
}
