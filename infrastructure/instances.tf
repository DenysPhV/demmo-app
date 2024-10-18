# EC2 Frontend
resource "aws_instance" "bastion" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name = var.instance_key_name
  count = var.instance_count
  subnet_id = aws_subnet.main_subnet[count.index].id
  associate_public_ip_address = true
  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
  user_data = file("./templates/user_data.sh")

  tags = {
    Name = "${var.environment_id} bastion instance"
  }
}


# EC2 for Node.js (Backend)
resource "aws_instance" "ci_cd" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.second_instance_type
  key_name = var.instance_key_name
  count = var.instance_count
  subnet_id = aws_subnet.main_subnet[count.index].id
  associate_public_ip_address = true
  # Security Group for HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
  user_data = file("./templates/user_data.sh")

  tags = {
    Name = "${var.environment_id} CI CD instance"
  }
}



