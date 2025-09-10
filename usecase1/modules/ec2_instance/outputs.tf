output "public_ip_address" {
  value = aws_instance.my_instance.public_ip
}
output "security_group_id" {
  value = aws_instance.my_instance.id
}