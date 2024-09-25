# EC2 інстанс для Node.js (Backend)
resource "aws_instance" "backend_instance" {
  ami = "ami-12345678"  # AMI для регіону AWS
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "BackendInstance"
  }

  # Додамо Security Group для дозволу HTTP/HTTPS
  vpc_security_group_ids = [aws_security_group.allow_http_https.id]
}

# Security Group для Backend
resource "aws_security_group" "allow_http_https" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_https"
  }
}
