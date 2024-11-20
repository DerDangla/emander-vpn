output "role_arn" {
  value = aws_iam_role.assume_role.arn
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.emander-instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.emander-instance.public_ip
}
