terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key = "ec2/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table ="terraform-lock-table"
        encrypt        = true
      
    }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


provider "aws" {
  region = var.region
}
}
