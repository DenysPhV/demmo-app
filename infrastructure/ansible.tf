resource "null_resource" "ansible_copy" {
  count = var.instance_count
  depends_on = [aws_instance.frontend_instance, aws_instance.backend_instance]
  connection {
    host = aws_instance.frontend_instance[count.index].public_ip
    type = "ssh"
    user = var.instance_user
    private_key = file(var.instance_key)
  }

  provisioner "file" {
    source = var.instance_key
    destination = var.destination_instance_internal_key
  }

  provisioner "remote-exec" {
    inline = ["sudo chmod 400 ${var.destination_instance_internal_key}" ]
  }

  provisioner "file" {
    source = "ansible"
    destination = "/home/${var.instance_user}/ansible"
  }

  provisioner "file" {
    content     = data.template_file.inventory.rendered
    destination = "/home/${var.instance_user}/ansible/inventory"
  }

  provisioner "file" {
    content     = data.template_file.group_vars.rendered
    destination = "/home/${var.instance_user}/ansible/group_vars/all"
  }

}

data "template_file" "inventory" {
  template = file("${path.module}/ansible/inventory")
  vars = {
    ci_cd_ips = join("\n", aws_instance.frontend_instance.*.private_ip)
  }
}

data "template_file" "group_vars" {
  template = file("${path.module}/ansible/group_vars/all")
  vars = {
    bastion_user = var.instance_user
    destination_bastion_internal_key = var.destination_instance_internal_key
    github_url                       = var.github_url
    registration_token               = var.registration_token
    runner_tags_list                 = var.runner_tags_list
    runner_executor                  = var.runner_executor
  }
}
