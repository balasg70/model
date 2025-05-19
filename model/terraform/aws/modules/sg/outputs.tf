output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.allow_ssh.id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.allow_ssh.arn
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.allow_ssh.name
}

output "security_group_description" {
  description = "The description of the security group"
  value       = aws_security_group.allow_ssh.description
}
