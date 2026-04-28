
output "ip-ec2-privada" {
  value       = aws_instance.pivada-ec2.private_ip
  description = "ip privado"

}

output "id-ec2-privada" {
  value       = aws_instance.pivada-ec2.id
  description = "id do ec2"
}
output "dns-lb" {
  value       = aws_lb.lb.dns_name
  description = "dns do lb"
}

output "rds-host" {
  value       = aws_db_instance.rds.endpoint
  description = "dns do lb"
}