data "aws_caller_identity" "current" {}

variable "aws_profile" {
   type = string
   description = "AWS profile"
 }

 variable "aws_region" {
   type = string
   description = "AWS region"
 }

variable "stripe_api_secret" {
   type = string
   description = "Stripe API Secret"
 }
 
  variable "stripe_webhook_secret" {
   type = string
   description = "Stripe webhook secret key"
 }

 variable "stripe_webhook_id" {
   type = string
   description = "Stripe webhook id"
 }

variable "appsync_api_id" {
  type = string
  description = "Appsync api id - Set after creating the appsync grapghq"
}

variable "graphql_endpoint_id" {
  type = string
  description = " XXX  in XXXXX.appsync-api.eu-central-1.amazonaws.com/graphql"
}

variable "api_gateway_id" {
   type = string
   description = "API gateway id, required to let that API gateway access stripe lambdas"
 }

variable "app_url" {
  type = string
  description = "Domain name such as www.mysite.com"
}

variable "project_name" {
  type = string
  description = "Domain name without www  eg: mysite.com"
}

resource "aws_iam_role" "StripeLibraryIamRole" {
    path = "/service-role/"
    name = "stripeLibrary"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
    managed_policy_arns = [
      aws_iam_policy.s3PresignerPolicy.arn,
      "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
      "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
      ]
}

resource "aws_lambda_permission" "StripeLibraryApiPermission" {
    action = "lambda:InvokeFunction"
    function_name = "stripeFunctions"
    principal = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${var.api_gateway_id}/*"
}

resource "aws_s3_object" "StripeLibrarySourceCode" {
  bucket = "${var.project_name}-staging-lambda"
  key    = "contentpub-lambdas-1.0-SNAPSHOT.jar"
  source = "contentpub-lambdas-1.0-SNAPSHOT.jar" # its mean it depended on zip
}

resource "aws_lambda_function" "StripeLambda" {
    description = "Stripe functions, product functions etc"
    function_name = "stripeFunctions"
    handler = "io.contentpub.stripe.StripeHandler::handleRequest"
    architectures = [
        "x86_64"
    ]
    s3_bucket = "${var.project_name}-staging-lambda"
    s3_key = aws_s3_object.StripeLibrarySourceCode.key
    memory_size = 512
    role = aws_iam_role.StripeLibraryIamRole.arn
    runtime = "java11"
    timeout = 20
    environment {
         variables = {
            stripe_webhook_secret = var.stripe_webhook_secret
            stripe_webhook_id = var.stripe_webhook_id
            stripe_api_secret = var.stripe_api_secret
            appsync_api_id = var.appsync_api_id
            graphql_endpoint_id = var.graphql_endpoint_id
            app_url = var.app_url
            aws_region = var.aws_region
            JAVA_TOOL_OPTIONS = "-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
         }
    }
    tracing_config {
        mode = "PassThrough"
    }
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
    region = var.aws_region

  default_tags {
    tags = {
      contentpubversion = "0.1"
      app       = var.project_name
    }
  }
}