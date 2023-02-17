data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "LambdaFunctionsStaging" {
    bucket = "${var.base_bucket_name}-staging-lambda"
}

resource "aws_s3_bucket" "LambdaFunctionsProduction" {
    bucket = "${var.base_bucket_name}-production-lambda"
}

resource "aws_s3_object" "S3SignerLambdaSourceCode" {
  bucket = "${var.base_bucket_name}-staging-lambda"
  key    = "s3Signer.zip"
  source = "s3Signer.zip" # its mean it depended on zip
}

resource "aws_s3_object" "StripeLibrarySourceCode" {
  bucket = "${var.base_bucket_name}-staging-lambda"
  key    = "contentpub-lambdas-1.0-SNAPSHOT.jar"
  source = "contentpub-lambdas-1.0-SNAPSHOT.jar" # its mean it depended on zip
}

resource "aws_iam_role" "S3SignerLambdaIamRole" {
    path = "/service-role/"
    name = "s3Signer"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
}

resource "aws_iam_role" "StripeLibraryIamRole" {
    path = "/service-role/"
    name = "stripeLibrary"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
}

 variable "stripe_api_key" {
   type = string
   description = "Stripe API Key"
 }

  variable "stripe_webhook_secret" {
   type = string
   description = "Stripe webhook secret key"
 }

resource "aws_lambda_function" "S3SignerLambda" {
    description = "To sign private S3 objects"
    function_name = "s3SignerFunction"
    handler = "index.handler"
    architectures = [
        "x86_64"
    ]
    s3_bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
    s3_key = aws_s3_object.S3SignerLambdaSourceCode.key
    memory_size = 128
    role = aws_iam_role.S3SignerLambdaIamRole.arn
    runtime = "nodejs14.x"
    tracing_config {
        mode = "PassThrough"
    }
}

resource "aws_lambda_function" "StripeLambda" {
    description = "Stripe functions, product functions etc"
    function_name = "stripeFunctions"
    handler = "io.contentpub.stripe.StripeHandler::handleRequest"
    architectures = [
        "x86_64"
    ]
    s3_bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
    s3_key = aws_s3_object.StripeLibrarySourceCode.key
    memory_size = 256
    role = aws_iam_role.StripeLibraryIamRole.arn
    runtime = "java11"
    timeout = 20
    environment {
         variables = {
            stripe_key = var.stripe_api_key
            stripe_webhook_secret = var.stripe_webhook_secret
         }
    }
    tracing_config {
        mode = "PassThrough"
    }
}

resource "aws_lambda_permission" "LambdaS3SignerApiPermissionIamRole" {
    action = "lambda:InvokeFunction"
    function_name = "s3SignerFunction"
    principal = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.ApiGatewayRestApi.id}/*/GET/bucket/*/object/*"
}

resource "aws_lambda_permission" "StripeLibraryApiPermissionIamRole" {
    action = "lambda:InvokeFunction"
    function_name = "stripeFunctions"
    principal = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.ApiGatewayRestApi.id}/*"
}
