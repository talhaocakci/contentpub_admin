

resource "aws_s3_bucket" "AmplifyDeploymentStaging" {
  bucket = "${var.base_bucket_name}-backend-staging-deployment"
}

resource "aws_s3_bucket" "AmplifyDeploymentProduction" {
  bucket = "${var.base_bucket_name}-backend-production-deployment"
}

resource "aws_s3_bucket" "RestrictedMediaBucketStaging" {
  bucket = "${var.base_bucket_name}-staging-restricted"
}

resource "aws_s3_bucket_public_access_block" "RestrictedMediaBucketStaging" {
    bucket = aws_s3_bucket.RestrictedMediaBucketStaging.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket" "RestrictedMediaBucketProd" {
  bucket = "${var.base_bucket_name}-production-restricted"
}

resource "aws_s3_bucket_public_access_block" "RestrictedMediaBucketProd" {
    bucket = aws_s3_bucket.RestrictedMediaBucketProd.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket" "PublicMediaBucketStaging" {
    bucket = "${var.base_bucket_name}-staging-public"
}

resource "aws_s3_bucket" "PublicMediaBucketProd" {
    bucket = "${var.base_bucket_name}-production-public"
}

resource "aws_s3_bucket" "CustomDomainAdminApp" {
    count = var.custom_domain != "" ? 1 : 0
    bucket = "admin.${var.custom_domain}"
}

resource "aws_s3_bucket" "CustomDomainClientRootApp" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "www.${var.custom_domain}"
}

resource "aws_s3_bucket" "CustomDomainClientStagingAdminApp" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "staging-admin.${var.custom_domain}"
}

resource "aws_s3_bucket" "CustomDomainClientStagingClientApp" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "staging-client.${var.custom_domain}"
}

resource "aws_s3_bucket" "CustomDomainClientApp" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "client.${var.custom_domain}"
}


resource "aws_s3_bucket_policy" "CustomDomainPublicPolicy" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "${var.custom_domain}"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"PublicReadGetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::${var.custom_domain}/*\"}]}"
}

resource "aws_s3_bucket_policy" "CustomDomainRootPolicy" {
     count = var.custom_domain != "" ? 1 : 0
    bucket = "www.${var.custom_domain}"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"PublicReadGetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::www.${var.custom_domain}/*\"}]}"
}