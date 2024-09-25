# EC2 інстанс для React (Frontend)
resource "aws_instance" "frontend_instance" {
  ami = "ami-12345678"  # AMI для вашого регіону AWS
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "FrontendInstance"
  }

  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
}
