resource "aws_route53_zone" "maxizavr-com" {
  provider = aws.eu

  name = "maxizavr.com"
  force_destroy = false
  comment = "maxizavr.com zone"
}

resource "aws_route53_record" "A-maxizavr-com" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com.zone_id
  name    = "maxizavr.com."
  type    = "A"
  ttl     = "300"
  records = ["51.255.78.233"]
}

resource "aws_route53_record" "A-outline-maxizavr-com" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com.zone_id
  name    = "outline.maxizavr.com."
  type    = "A"

  alias {
    name                   = "maxizavr.com." 
    zone_id                = aws_route53_zone.maxizavr-com.zone_id
    evaluate_target_health = false
  }

  depends_on = [aws_route53_record.A-maxizavr-com]
}

resource "aws_route53_record" "A-sandbox-maxizavr-com" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com.zone_id
  name    = "sandbox.maxizavr.com."
  type    = "A"

  alias {
    name                   = "maxizavr.com." 
    zone_id                = aws_route53_zone.maxizavr-com.zone_id
    evaluate_target_health = false
  }

  depends_on = [aws_route53_record.A-maxizavr-com]
}

resource "aws_route53_record" "A-proxmox-maxizavr-com" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com.zone_id
  name    = "proxmox.maxizavr.com."
  type    = "A"

  alias {
    name                   = "maxizavr.com." 
    zone_id                = aws_route53_zone.maxizavr-com.zone_id
    evaluate_target_health = false
  }

  depends_on = [aws_route53_record.A-maxizavr-com]
}

#resource "aws_route53_zone" "maxizavr-com-private" {
#  provider = aws.eu
#
#  name = "maxizavr.com"
#  force_destroy = false
#  comment = "maxizavr.com zone"
#
#  vpc {
#    vpc_id = module.eu_vpc.vpc_id
#  }
#}
#
#resource "aws_route53_record" "A-sandbox1-maxizavr-com-private" {
#  provider = aws.eu
#
#  zone_id = aws_route53_zone.maxizavr-com-private.zone_id
#  name    = "sandbox1.maxizavr.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["10.1.1.11"]
#}
#
#resource "aws_route53_record" "A-sandbox2-maxizavr-com-private" {
#  provider = aws.eu
#
#  zone_id = aws_route53_zone.maxizavr-com-private.zone_id
#  name    = "sandbox2.maxizavr.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["10.1.1.12"]
#}
