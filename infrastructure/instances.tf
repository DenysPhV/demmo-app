# EC2 інстанс для Node.js (Backend)
resource "aws_instance" "backend_instance" {
  count = var.instance_count
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  subnet_id = data.terraform_remote_state.network.outputs.main_subnet_ids[count.index]
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment_id} Backend Instance"
  }

  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
}

# EC2 інстанс для React (Frontend)
resource "aws_instance" "frontend_instance" {
  count = var.instance_count
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  subnet_id = data.terraform_remote_state.network.outputs.main_subnet_ids[count.index]
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment_id} Frontend Instance"
  }

  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
}