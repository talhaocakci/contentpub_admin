resource "aws_cognito_user" "example" {
  user_pool_id = "eu-central-1_JR4g3qGS8"
  username     = "${var.user_email}"
  temporary_password = "Abcd123!"

  attributes = {
    isAdmin="true"
    email          = "${var.user_email}"
    email_verified = true
  }
}

variable "aws_profile" {
  type        = string
  description = "AWS profile"
}

variable "user_email" {
  type        = string
  description = "AWS profile"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

provider "aws" {
    profile = var.aws_profile
    region = var.aws_region

   
  default_tags {
    tags = {
      contentpubversion = "0.1"
    }
  
}
}