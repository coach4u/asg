region                  = "us-east-1"
vpc_id                  = "vpc-123456"
subnets                 = ["subnet-aaa", "subnet-bbb"]
alb_security_groups     = ["sg-111111"]
instance_security_groups = ["sg-222222"]

ami_id        = "ami-0abcd1234efgh5678"
instance_type = "t3.micro"
key_name      = "dev-keypair"
user_data     = <<-EOT
#!/bin/bash
echo "Hello from Dev ASG instance" > /var/www/html/index.html
EOT
