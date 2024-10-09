# EC2 for Node.js (Backend)
resource "aws_instance" "backend_instance" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name = var.instance_key_name
  count = var.instance_count
  subnet_id = aws_subnet.main_subnet[count.index].id
  associate_public_ip_address = true
  # Security Group for HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]

  tags = {
    Name = "${var.environment_id} Backend Instance"
  }

}


# EC2 Frontend
resource "aws_instance" "frontend_instance" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name = var.instance_key_name
  count = var.instance_count
  subnet_id = aws_subnet.main_subnet[count.index].id
  associate_public_ip_address = true
  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]

  tags = {
    Name = "${var.environment_id} Frontend Instance"
  }

}

