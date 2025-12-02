variable "region" {
  type        = string
  description = "AWS region for dev environment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for dev environment"
}

variable "subnets" {
  type        = list(string)
  description = "Subnet IDs for dev environment"
}

variable "alb_security_groups" {
  type        = list(string)
  description = "Security groups for ALB"
}

variable "instance_security_groups" {
  type        = list(string)
  description = "Security groups for EC2 instances"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "user_data" {
  type        = string
  description = "User data script content"
  default     = ""
}
