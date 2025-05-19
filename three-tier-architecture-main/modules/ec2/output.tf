output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.main.id
}

output "asg_name" {
  description = "Name of the autoscaling group"
  value       = aws_autoscaling_group.main.name
}