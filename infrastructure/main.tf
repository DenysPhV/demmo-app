# main.tf
provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "backend_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-bucket"
}

# Створимо VPC (Virtual Private Cloud)
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "MainVPC"
  }
}

# Створення Subnet (підмережі)
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "MainSubnet"
  }
}

# Створення Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Створення Route Table
resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "MainRouteTable"
  }
}

# Прив'язка Route Table до Subnet
resource "aws_route_table_association" "main_route_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_route_table.id
}

