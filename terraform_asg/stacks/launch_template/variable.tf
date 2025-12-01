variable "env" {
  type = string
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "name" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "security_group_ids" { type = list(string) }
variable "subnet_id" { type = string }
variable "user_data_file"{ type = string }
variable "key_name" { type = string }

