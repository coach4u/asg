resource "aws_instance" "this" {
    ami=var.ami
    instance_type=var.instance_type
    key_name=var.key_name

    tags = {
         Name="ec2-${var.environment}"
         Environment=var.environment
    }
}