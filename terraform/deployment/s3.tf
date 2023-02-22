
# S3 bucket for website.
resource "aws_s3_bucket" "staging_bucket" {
  bucket = "${var.project_name}-staging-app"

}

resource "aws_s3_bucket_policy" "stage_deployment-policy" {
  bucket = aws_s3_bucket.staging_bucket.bucket
  policy = templatefile("s3-policy.json", { bucket = "${var.project_name}-staging-app" })
}

resource "aws_s3_bucket_website_configuration" "staging_website_configuration" {
  bucket = aws_s3_bucket.staging_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "staging_bucket-acl" {
  bucket = aws_s3_bucket.staging_bucket.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "staging_bucket" {
  bucket = aws_s3_bucket.staging_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "staging_bucket_public_access" {
  bucket = aws_s3_bucket.staging_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_cors_configuration" "staging_cors" {
  bucket = aws_s3_bucket.staging_bucket.id

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
  mime_types = module.file_extensions.mappings
  folder_files = flatten([for d in flatten(fileset("${path.module}/artifacts", "**")) : trim( d, "../") ])
}

output "locals" {
  value = local.folder_files
}

output "mimetypes" {
  value = module.file_extensions.mappings
}

resource "aws_s3_object" "this" {
  for_each = { for idx, file in local.folder_files : idx => file }

  bucket       = aws_s3_bucket.staging_bucket.bucket
  key          = "${each.value}"
  content_type = length(split(".", each.value)) > 1 ? lookup(local.mime_types, split(".", each.value)[1], null) : null
  source       = "${path.module}/artifacts/${each.value}"
  etag = "${path.module}/artifacts/${each.value}"
}

variable "project_name" {
  type        = string
  description = "Project name. Your files and AWS components will be structured relative to this base name. It can be your domain name such as x.com or your project name that can be unique across all AWS"
}


module "file_extensions" {
  source  = "reifnir/mime-map/null"
}
