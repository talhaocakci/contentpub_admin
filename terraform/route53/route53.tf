terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}



resource "aws_route53_zone" "Route53HostedZone" {
    name = "contentpub.io."
}

resource "aws_route53_record" "Route53RecordSet" {
    name = "contentpub.io."
    type = "NS"
    ttl = 172800
    records = [
        "ns-1312.awsdns-36.org.",
        "ns-1845.awsdns-38.co.uk.",
        "ns-881.awsdns-46.net.",
        "ns-205.awsdns-25.com."
    ]
    zone_id = "Z0353972VVMFUZCXHHNT"
}

resource "aws_route53_record" "Route53RecordSet2" {
    name = "contentpub.io."
    type = "SOA"
    ttl = 900
    records = [
        "ns-1312.awsdns-36.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
    ]
    zone_id = "Z0353972VVMFUZCXHHNT"
}