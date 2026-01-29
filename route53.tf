resource "aws_route53_zone" "main" {
  name = "getlow.in.net"

  lifecycle {
  prevent_destroy = false
}
}
