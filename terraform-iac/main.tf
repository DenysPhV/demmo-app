provider "aws" {
  region = var.region
  profile = "default"
  #noinspection HCLUnknownBlockType
  default_tags {
    tags = {
      Environment = var.environment_id
      Role = "${var.environment_name} Networking"
      Purpose = var.purpose
    }
  }
}

resource "aws_instance" "backend_instance" {
  ami = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "frontend-bucket"
}

# terraform {
#   backend "s3" {
#     region = "eu-west-1"
#     bucket = ""
#     key = "network/terraform.tfstate"
#     dynamodb_table = ""
#   }
# }
