variable "aws_profile" {
  type        = string
  description = "AWS profile"
}

variable "base_bucket_name" {
  type        = string
  description = "Base s3 bucket name. Your files will be structured relative to this base name. It can be your domain name such as x.com or your project name that can be unique across all AWS"
}

variable "custom_domain" {
  type        = string
  description = "Used for deploying Content Pub Web applications to S3 and serve from there. Must be the same with domain name such as mydomain.com without www. Subdomain buckets will be created automatically "
}


terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.15.1"
        }
    }
}

provider "aws" {
    profile = var.aws_profile
    region = "us-east-1"
}