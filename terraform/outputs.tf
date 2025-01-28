output "instance_1_public_ip" {
  description = "Public IP address of the first instance"
  value       = aws_instance.example1.public_ip
}

output "instance_2_public_ip" {
  description = "Public IP address of the second instance"
  value       = aws_instance.example2.public_ip
}

