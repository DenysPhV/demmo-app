# terraform {
#   backend "s3" {
#     region  = "eu-west-3"
#     bucket  = "mindlab-platform-terraform"
#     key = "infra-mindlab/terraform.tfstate"
#     dynamodb_table = "mindlab-platform-terraform-tb"
#     encrypt = false
#   }
# }

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment_id
      Role = "${var.environment_name} State bucket"
      Purpose = var.purpose
    }
  }
}


