# main.tf
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.environment_id
      Role = "${var.environment_name} Networking"
      Purpose = var.purpose
    }
  }

}

# terraform {
#   backend "s3" {
#     region = var.region
#     bucket = var.state_bucket
#     key = "network/terraform.tfstate"
#     dynamodb_table = var.table_name
#   }
# }





