variable "name" {
  type        = string
  description = "ASG name"
}

variable "launch_template_id" {
  type = string
}

variable "launch_template_version" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}
