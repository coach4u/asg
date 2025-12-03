region                  = "us-east-1"
vpc_id                  = "vpc-046f27a5df03f3e8e"
subnets                 = ["subnet-08151fdcd1cc506bb", "subnet-022c7d8cfebc1721a"]
alb_security_groups     = ["sg-0a4f7b4a5d2e0bb5f"]
instance_security_groups = ["sg-0a4f7b4a5d2e0bb5f"]

ami_id        = "ami-0ecb62995f68bb549"
instance_type = "t3.micro"
key_name      = "keypair101"
user_data     = <<-EOT
#!/bin/bash
echo "Hello from Dev ASG instance" > /var/www/html/index.html
EOT
