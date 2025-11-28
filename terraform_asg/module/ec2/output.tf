output "instance_id" {
    value = { for instance_name, instance_obj in aws_instance.this :
    instance_name => instance_obj.id
  }
}
 
