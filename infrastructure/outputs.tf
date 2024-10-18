output "backend_url" {
  value = var.backend_url
}

output "frontend_url" {
  value = var.frontend_url
}

output "main_subnet_ids" {
  value = aws_subnet.main_subnet.*.id
}

output "bastion_server_ip" {
  value = aws_instance.bastion.*.public_ip
}

output "ci_cd_server_ip" {
  value = aws_instance.ci_cd.*.public_ip
}