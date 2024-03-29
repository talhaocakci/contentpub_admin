

resource "aws_s3_bucket" "AmplifyDeploymentStaging" {
  bucket = "${var.project_name}-backend-staging-deployment"
}

resource "aws_s3_bucket" "AmplifyDeploymentProduction" {
  bucket = "${var.project_name}-backend-production-deployment"
}

resource "aws_s3_bucket" "RestrictedMediaBucketStaging" {
  bucket = "${var.project_name}-staging-restricted"
}

resource "aws_s3_bucket_cors_configuration" "RestrictedMediaBucketStagingCors" {
  bucket = aws_s3_bucket.RestrictedMediaBucketStaging.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_public_access_block" "RestrictedMediaBucketStaging" {
    bucket = aws_s3_bucket.RestrictedMediaBucketStaging.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket" "RestrictedMediaBucketProd" {
  bucket = "${var.project_name}-production-restricted"
}

resource "aws_s3_bucket_cors_configuration" "RestrictedMediaBucketProdCors" {
  bucket = aws_s3_bucket.RestrictedMediaBucketProd.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_public_access_block" "RestrictedMediaBucketProd" {
    bucket = aws_s3_bucket.RestrictedMediaBucketProd.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket" "PublicMediaBucketStaging" {
    bucket = "${var.project_name}-staging-public"
}

resource "aws_s3_bucket_public_access_block" "PublicMediaBucketStagingAccess" {
    bucket = aws_s3_bucket.PublicMediaBucketStaging.id
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_public_access_block" "PublicMediaBucketProdAccess" {
    bucket = aws_s3_bucket.PublicMediaBucketProd.bucket
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "stage_public_bucket_policy" {
  bucket = aws_s3_bucket.PublicMediaBucketStaging.bucket
  policy = templatefile("s3-policy.json", { bucket = aws_s3_bucket.PublicMediaBucketStaging.bucket })
}

resource "aws_s3_bucket_cors_configuration" "PublicMediaBucketStagingCors" {
  bucket = aws_s3_bucket.PublicMediaBucketStaging.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket" "PublicMediaBucketProd" {
    bucket = "${var.project_name}-production-public"
}

resource "aws_s3_bucket_policy" "production_public_bucket_policy" {
  bucket = aws_s3_bucket.PublicMediaBucketProd.bucket
  policy = templatefile("s3-policy.json", { bucket = aws_s3_bucket.PublicMediaBucketProd.bucket })
}

resource "aws_s3_bucket_cors_configuration" "PublicMediaBucketProdCors" {
  bucket = aws_s3_bucket.PublicMediaBucketProd.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

