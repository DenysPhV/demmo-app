resource "aws_route53_zone" "main_zone" {
  name = "yourdomain.com"
}

resource "aws_route53_record" "frontend_record" {
  zone_id = aws_route53_zone.main_zone.zone_id
  name = "www"
  type = "A"
  ttl = 300

  records = [aws_instance.frontend_instance.public_ip]
}

resource "aws_route53_record" "backend_record" {
  zone_id = aws_route53_zone.main_zone.zone_id
  name = "api"
  type = "A"
  ttl = 300

  records = [aws_instance.backend_instance.public_ip]
}