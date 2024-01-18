output "public_ips" {
  value = aws_instance.dsa_instance[*].public_ip
}
