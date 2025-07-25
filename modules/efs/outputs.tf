output "efs_id" {
  description = "The ID of the EFS file system"
  value       = aws_efs_file_system.efs.id
}

output "efs_sg_id" {
  description = "EFS security group ID"
  value       = aws_security_group.efs_sg.id
}
