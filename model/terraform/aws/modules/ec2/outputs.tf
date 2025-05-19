output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.web.arn
}
