locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
}

# App - Launch Template
resource "aws_launch_template" "main" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  #vpc_security_group_ids = [var.app_security_group]
  user_data              = filebase64("./modules/ec2/install.sh")
  #key_name - allows private key (.pem file) to be used with ec2 instance
  key_name = var.key_name

network_interfaces {
    security_groups = [var.app_security_group]
  }

  connection {
    type  = var.connection_type
    user  = var.connection_user
    #private_key is created within AWS EC2 Console, .pem file placed in same directory as .tf
    private_key = file("./terraform.pem")
    host = var.connection_host
   }

resource "aws_autoscaling_group" "main" {
  name                = "${var.project_name}-${var.environment}-asg"
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  tags = local.required_tags
}
