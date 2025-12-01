variable "env" { type = string }
variable "region" { type = string, default = "us-east-1" }

variable "instance_names" { type = list(string) }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "security_group_id" { type = string }
variable "key_name" { type = string }

