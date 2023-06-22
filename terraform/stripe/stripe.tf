
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

resource "aws_iam_role" "StripeLibraryIamRole" {
    path = "/service-role/"
    name = "stripeLibrary"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
}

resource "aws_s3_object" "StripeLibrarySourceCode" {
  bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
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
    s3_bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
    s3_key = aws_s3_object.StripeLibrarySourceCode.key
    memory_size = 256
    role = aws_iam_role.StripeLibraryIamRole.arn
    runtime = "java11"
    timeout = 20
    environment {
         variables = {
            stripe_webhook_secret = var.stripe_webhook_secret
            stripe_webhook_id = var.stripe_webhook_id
            stripe_api_secret = var.stripe_api_secret
            appsync_api_id = var.appsync_api_id
            app_url = var.app_url
            JAVA_TOOL_OPTIONS = "-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
         }
    }
    tracing_config {
        mode = "PassThrough"
    }
}