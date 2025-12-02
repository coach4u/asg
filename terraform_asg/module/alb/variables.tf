variable "env" {
  description = "Environment name (e.g., dev, qa, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}
