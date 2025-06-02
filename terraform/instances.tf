resource "aws_security_group" "app_sg" {
  name        = "app-sg-${var.environment}"
  description = "Security group for application instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "java_app" {
  name_prefix   = "java-app-"
  image_id      = "ami-12345678" # AMI avec Java pré-installé
  instance_type = "t3.micro"
  key_name      = "your-key-pair"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.app_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo yum install -y java-11-amazon-corretto
              # Ajoutez vos commandes de déploiement ici
              EOF
             )
}

resource "aws_autoscaling_group" "java_app" {
  name_prefix          = "asg-java-app-"
  vpc_zone_identifier = aws_subnet.private_subnet[*].id
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4

  launch_template {
    id      = aws_launch_template.java_app.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]
}
