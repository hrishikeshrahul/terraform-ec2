resource "aws_route53_zone" "main" {
  name = "getlow.in.net"
}

resource "aws_route53_record" "attendance" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "attendance.getlow.in.net"
  type    = "A"
  ttl     = 300
  records = [aws_instance.my_ec2.public_ip]
}
