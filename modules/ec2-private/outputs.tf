output "private_instance_id" {
  value = aws_instance.private_instance.id
}

output "security_group_id" {
 value = aws_security_group.sg.id 
}
