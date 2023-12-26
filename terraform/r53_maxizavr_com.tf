resource "aws_route53_zone" "maxizavr-com" {
  provider = aws.eu

  name = "maxizavr.com"
  force_destroy = false
  comment = "maxizavr.com zone"
}

resource "aws_route53_zone" "maxizavr-com-private" {
  provider = aws.eu

  name = "maxizavr.com"
  force_destroy = false
  comment = "maxizavr.com zone"

  vpc {
    vpc_id = module.eu_vpc.vpc_id
  }
}

resource "aws_route53_record" "A-sandbox1-maxizavr-com-private" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com-private.zone_id
  name    = "sandbox1.maxizavr.com."
  type    = "A"
  ttl     = "300"
  records = ["10.1.1.11"]
}

resource "aws_route53_record" "A-sandbox2-maxizavr-com-private" {
  provider = aws.eu

  zone_id = aws_route53_zone.maxizavr-com-private.zone_id
  name    = "sandbox2.maxizavr.com."
  type    = "A"
  ttl     = "300"
  records = ["10.1.1.12"]
}

#resource "aws_route53_record" "A-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = [local.actimind_public_ip]
#}
#
#resource "aws_route53_record" "MX-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "actimind.com."
#  type    = "MX"
#  ttl     = "300"
#  records = ["10 relay.actimind.com."]
#}
#
#resource "aws_route53_record" "TXT-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=spf1 ip4:95.216.28.8 ip4:188.40.125.125 a:actimind.com ~all"]
#}
#
#resource "aws_route53_record" "TXT--dmarc-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "_dmarc.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=DMARC1; p=quarantine; pct=100; ri=86400; rua=mailto:sysadmin@actimind.com"]
#}
#
#resource "aws_route53_record" "TXT--domainkey-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "_domainkey.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["o=~"]
#}
#
#resource "aws_route53_record" "TXT-aws-domainkey-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "aws._domainkey.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwMcXnllSpR8Owd9bXDZkVKbeuJ3NVsgkazgg5XXFXKB3cGr/uGzK/91vZJSErsA/DHlZpj5smUPVv/rme6nITRg4M9cS+cOiDieaT6pdtAxESqRvDtsdu+XN5kJfwe1JCW6YPQziaytcd8GoGlRQBSKGKyzl7IWjklz1RF+IU4QIDAQAB"]
#}
#
#resource "aws_route53_record" "TXT-dkim-domainkey-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "dkim._domainkey.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=DKIM1; k=rsa; h=sha256; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYcHIA/brmy1etl0CwC1Ns+tIlS2BGjqBiL+E5rzKdwFZbldoITRmNmPAijE9/nfaM/pi4GgwMK6otJ+Mw+BGzbKIb3OfySgQrP8oL7i/FsRUhqmC9HUNxvYb/zwRsBKoa55XChhf5Y4c1tvQPGg/sN4+CuFiVg3GPwxbP+EU+xwIDAQAB"]
#}
#
#resource "aws_route53_record" "TXT-dkim2301-domainkey-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "dkim2301._domainkey.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=DKIM1; h=sha256; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDB35DRwW+YczOlfWNkje4l+o0mg42Ibrt4wB/MqQrW9xLWyQpFxgZtVwwsA9Czh+zKWYB6xMoJIXPbthZEn60sSMIMDweqvI8UmrRZw19rTS8Dnhp2fJur4gCnRjV1TMEU6YLs9HR6FPLSXrmPHsZwCkzUR7bOEG3SBbSwsDCicQIDAQAB"]
#}
#
#resource "aws_route53_record" "TXT-maileur-domainkey-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "maileur._domainkey.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/gHhGkkolzTv3Cs3AFsNO/tS2CpwdvaB0J/yYHwh39ZC94EpCNGlfY5ymNobO6qcxsUA6eakMyS/LDvbdqlwQsoNyiSuG8U8CkO+L/XlJHKe20jeoVszUu0dn7S2vN1jsAKUwvfYQR0blS1rsQN8bTm7KbzniXZ7o6+PQEGAROQIDAQAB"]
#}
#
#resource "aws_route53_record" "SRV--autodiscover-tcp-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "_autodiscover._tcp.actimind.com."
#  type    = "SRV"
#  ttl     = "300"
#  records = ["0 0 443 autodiscover.actimind.com"]
#}
#
#resource "aws_route53_record" "CNAME-actitime-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "actitime.actimind.com."
#  type    = "CNAME"
#  ttl     = "300"
#  records = ["www.actimind.com"]
#}
#
#resource "aws_route53_record" "CNAME-actiwate-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "actiwate.actimind.com."
#  type    = "CNAME"
#  ttl     = "300"
#  records = ["www.actimind.com"]
#}
#
#resource "aws_route53_record" "A-amazon-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "amazon.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = [local.online_us_public_ip]
#}
#
#resource "aws_route53_record" "CNAME-autoconfig-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "autoconfig.actimind.com."
#  type    = "CNAME"
#  ttl     = "300"
#  records = ["autodiscover.actimind.com"]
#}
#
#resource "aws_route53_record" "CNAME-autodiscover-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "autodiscover.actimind.com."
#  type    = "CNAME"
#  ttl     = "300"
#  records = ["vault.actimind.com"]
#}
#
#resource "aws_route53_record" "A-betelgeuse-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "betelgeuse.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["138.201.226.153"]
#}
#
#resource "aws_route53_record" "A-custom-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "custom.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = [local.custom_us_public_ip]
#}
#
#resource "aws_route53_record" "MX-fthd-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "fthd.actimind.com."
#  type    = "MX"
#  ttl     = "300"
#  records = ["10 relay.actimind.com."]
#}
#
#resource "aws_route53_record" "A-gate0-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "gate0.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["81.95.18.150"]
#}
#
#resource "aws_route53_record" "A-gate2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "gate2.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["81.95.18.150"]
#}
#
#resource "aws_route53_record" "A-gate4-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "gate4.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["142.132.206.113"]
#}
#
#resource "aws_route53_record" "A-gitlab-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "gitlab.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["142.132.206.113"]
#}
#
#resource "aws_route53_record" "A-htznr-pbs-01-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "htznr-pbs-01.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["138.201.226.151"]
#}
#
#resource "aws_route53_record" "A-htznr-pbs-02-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "htznr-pbs-02.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["116.202.195.213"]
#}
#
#resource "aws_route53_record" "A-jira-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "jira.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["5.9.195.147"]
#}
#
#resource "aws_route53_record" "A-mail-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "mail.actimind.com."
#  type    = "A"
#  ttl     = "600"
#  records = ["95.216.28.43"]
#}
#
#resource "aws_route53_record" "A-ns1-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "ns1.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["91.121.64.153"]
#}
#
#resource "aws_route53_record" "A-ns2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "ns2.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["91.121.64.153"]
#}
#
#resource "aws_route53_record" "A-ns3-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "ns3.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["147.135.239.193"]
#}
#
#resource "aws_route53_record" "A-pmg1-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg1.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["188.40.125.125"]
#}
#
#resource "aws_route53_record" "TXT-pmg1-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg1.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=spf1 ip4:95.216.28.8 ip4:188.40.125.125 a:actimind.com ~all"]
#}
#
#resource "aws_route53_record" "A-pmg2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg2.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["95.216.28.8"]
#}
#
#resource "aws_route53_record" "TXT-pmg2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg2.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=spf1 ip4:95.216.28.8 ip4:188.40.125.125 a:actimind.com ~all"]
#}
#
#resource "aws_route53_record" "A-pmg3-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg3.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["188.40.125.126"]
#}
#
#resource "aws_route53_record" "A-pmg4-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pmg4.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["95.216.28.14"]
#}
#
#resource "aws_route53_record" "A-proxy-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "proxy.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["5.9.195.150"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-1-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-1.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["188.40.127.51"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-2.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["95.216.28.48"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-3-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-3.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["142.132.206.116"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-5-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-5.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["135.181.210.229"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-6-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-6.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["167.235.15.241"]
#}
#
#resource "aws_route53_record" "A-pve-htznr-7-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "pve-htznr-7.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["116.202.195.233"]
#}
#
#resource "aws_route53_record" "A-relay-internal-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "relay-internal.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["81.95.18.156"]
#}
#
#resource "aws_route53_record" "A-relay-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "relay.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["95.216.28.8", "188.40.125.125"]
#}
#
#resource "aws_route53_record" "A-vault-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "vault.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["5.9.195.146"]
#}
#
#resource "aws_route53_record" "A-vpn-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "vpn.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["81.95.18.146"]
#}
#
#resource "aws_route53_record" "A-vpn2-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "vpn2.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = ["142.132.206.113", "167.235.15.228"]
#}
#
#resource "aws_route53_record" "A-www-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "www.actimind.com."
#  type    = "A"
#  ttl     = "300"
#  records = [local.actimind_public_ip]
#}
#
#resource "aws_route53_record" "MX-www-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "www.actimind.com."
#  type    = "MX"
#  ttl     = "300"
#  records = ["10 relay.actimind.com."]
#}
#
#resource "aws_route53_record" "TXT-www-actimind-com" {
#  provider = aws.us
#
#  zone_id = aws_route53_zone.actimind-com.zone_id
#  name    = "www.actimind.com."
#  type    = "TXT"
#  ttl     = "300"
#  records = ["v=spf1 a mx ip4:95.216.28.8 ~all"]
#}
