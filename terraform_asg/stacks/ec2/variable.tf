variable "name" {
  type = string
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
  type    = string
}

variable "user_data_file" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
}

variable "env" {
  type = string
}


