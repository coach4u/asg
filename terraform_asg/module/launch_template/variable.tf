variable "name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "user_data" {
  type    = string
  default = ""
}
