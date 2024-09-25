provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "backend_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-bucket"
}