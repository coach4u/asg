region                  = "us-east-1"
vpc_id                  = "vpc-0699cd773a3bd679a"
subnets                 = ["subnet-0ccb1f2bfeef8d7bb", "subnet-06c1f32b27925fbaa"]
alb_security_groups     = ["sg-0e8abfc69a3c26f6f"]
instance_security_groups = ["sg-0e8abfc69a3c26f6f"]

ami_id        = "ami-0ecb62995f68bb549"
instance_type = "t3.micro"
key_name      = "keypair101"
user_data     = <<-EOT
#!/bin/bash
echo "Hello from Dev ASG instance" > /var/www/html/index.html
EOT
