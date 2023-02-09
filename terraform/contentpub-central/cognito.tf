terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.15.1"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_cognito_user_pool" "ContentPubUserPool" {
  name = "contentpub-user-pool"

  username_attributes = ["email"]
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length = 6
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject = "Account Confirmation"
    email_message = "Your confirmation code is {####}"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }
}

# without secret
resource "aws_cognito_user_pool_client" "ContentPubClientWeb" {
  name = "contentpub-client-web"

  user_pool_id = aws_cognito_user_pool.ContentPubUserPool.id
  generate_secret = false
  refresh_token_validity = 90
  prevent_user_existence_errors = "ENABLED"
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
  
}

# with secret
resource "aws_cognito_user_pool_client" "ContentPubClientMobile" {
  name = "contentpub-client-mobile"

  user_pool_id = aws_cognito_user_pool.ContentPubUserPool.id
  generate_secret = true
  refresh_token_validity = 90
  prevent_user_existence_errors = "ENABLED"
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
  
}

resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = "contentpub-central"
  user_pool_id = "${aws_cognito_user_pool.ContentPubUserPool.id}"
}