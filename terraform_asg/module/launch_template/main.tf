resource "aws_iam_role" "ec2_role" {
  name = "${var.name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}



data "aws_iam_policy_document" "ssm" {
  statement {
    actions = [
      "ssm:*",
      "ec2messages:*",
      "cloudwatch:*",
      "logs:*",
      "s3:GetObject"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name   = "${var.name}-policy"
  policy = data.aws_iam_policy_document.ssm.json
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.name}-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_launch_template" "lt" {
  name_prefix   = "${var.name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  network_interfaces {
    security_groups = var.security_group_ids
  }

  user_data = var.user_data 

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name}"
      Environment = var.env
    }
  }
}


#output "launch_template_id" {
#  value = aws_launch_template.lt.id
#}

#output "launch_template_arn" {
#  value = aws_launch_template.lt.arn
#}

#output "launch_template_latest_version" {
#  value = aws_launch_template.lt.latest_version
#}
