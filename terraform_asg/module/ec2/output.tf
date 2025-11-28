output "instance_ids" {
    value = { for instance_name, instance in aws_instance.this :
    instance_name => instance.id
  }
}
 
