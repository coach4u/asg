output "instance_ids" {
    value = { for instance_name, instance in aws_instance.this :
    instance_name => instance.id }
  }
output "private_ips" {
     value={ for instance_name,instance in aws_instance.this: 
     instance_name=> instance.private_ip }
}
output "public_ip" {
     value={for instance_name,instance in aws_instance.this:
     instance_name=> instance.public_ip }
}
output "public_dns" {
  value = { for name, inst in aws_instance.this : name => inst.public_dns }
}

 
