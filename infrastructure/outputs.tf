output "backend_url" {
  value = var.backend_url
}

output "frontend_url" {
  value = var.frontend_url
}

output "main_subnet_ids" {
  value = aws_subnet.main_subnet.*.id
}