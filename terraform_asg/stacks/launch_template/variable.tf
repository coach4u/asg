variable "region" {
  description = "AWS region for deployment"
  type        = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "user_data_file" {
  type    = string
  default = ""
}

variable "env" {
  type = string
}
