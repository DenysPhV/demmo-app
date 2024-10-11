output "backend_url" {
  value = var.backend_url
}

output "frontend_url" {
  value = var.frontend_url
}

output "main_subnet_ids" {
  value = aws_subnet.main_subnet.*.id
}

output "frontend_server_ip" {
  value = aws_instance.frontend_instance.*.public_ip
}

output "backend_server_ip" {
  value = aws_instance.backend_instance.*.public_ip
}