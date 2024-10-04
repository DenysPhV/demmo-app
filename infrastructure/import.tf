data "terraform_remote_state" "network" {
  backend = "s3"
  workspace = terraform.workspace
  config = {
    bucket = var.state_bucket
    key = "network/terraform.tfstate"
    region = var.region
  }
}


data "aws_ami" "latest_amazon_linux" {
  owners = ["amazon"]
  most_recent = true
  filter{
    name = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]
  }
}

data "aws_route53_zone" "public" {
  name = var.public_zone_name
}
