resource "aws_route53_zone" "primary" {
  name = "my-terraform-example.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.my-terraform-example.com"
  type    = "A"
  ttl     = "300"
  records = ["198.40.6.7"]
}

resource "aws_route53_record" "www01" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "av.my-terraform-example.com"
  type    = "A"
  ttl     = "300"
  records = ["198.40.6.8"]
}


resource "aws_route53_record" "www02" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "gk.my-terraform-example.com"
  type    = "A"
  ttl     = "300"
  records = ["198.40.6.9"]
}
