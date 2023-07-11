
# S3 bucket for website.
resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.project_name}"
}

resource "aws_s3_bucket_public_access_block" "www-prod-bucket-access" {
    bucket = aws_s3_bucket.www_bucket.bucket
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "www_deployment-policy" {
  bucket = aws_s3_bucket.www_bucket.bucket
  policy = templatefile("s3-policy.json", { bucket = "www.${var.project_name}" })
}

resource "aws_s3_bucket_website_configuration" "www_website_configuration" {
  bucket = aws_s3_bucket.www_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "www_bucket_versioning" {
  bucket = aws_s3_bucket.www_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "www_bucket_public_access" {
  bucket = aws_s3_bucket.www_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_cors_configuration" "www_bucket_cors" {
  bucket = aws_s3_bucket.www_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["POST"]
    allowed_origins = ["*"] // correct this with granular cors later on
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

locals{
  mime_types_app = module.file_extensions.mappings
  folder_files_app = flatten([for d in flatten(fileset("${var.app_local_folder}/build/web", "**")) : trim( d, "../") ])
}

resource "aws_s3_object" "this_www" {
  for_each = { for idx, file in local.folder_files_app : idx => file }

  bucket       = aws_s3_bucket.www_bucket.bucket
  key          = "${each.value}"
  content_type = length(split(".", each.value)) > 1 ? lookup(local.mime_types_app, split(".", each.value)[1], null) : null
  source       = "${var.app_local_folder}/build/web/${each.value}"
  etag = "${path.module}/app/${each.value}"
}
