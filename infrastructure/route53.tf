resource "aws_route53_zone" "main_zone" {
  name = var.public_zone_name
  vpc {
    vpc_id = aws_vpc.main_vpc.id
  }
  tags = {
    Environment = "${var.environment_name} Private Hosted Zone"
  }
}


