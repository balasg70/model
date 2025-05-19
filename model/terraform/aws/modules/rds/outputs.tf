output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.default.id
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.default.arn
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.default.status
}

output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.default.port
}
