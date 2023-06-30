data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "LambdaFunctionsStaging" {
    bucket = "${var.project_name}-staging-lambda"
}

resource "aws_s3_bucket" "LambdaFunctionsProduction" {
    bucket = "${var.project_name}-production-lambda"
}

resource "aws_iam_role" "S3PreSignerLambdaIamRole" {
  path = "/service-role/"
  name = "s3Presigner"
  assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  max_session_duration = 3600
  managed_policy_arns = [
    aws_iam_policy.s3PresignerPolicy.arn, 
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}


variable "appsync_api_id" {
  type = string
  description = "Appsync api id - Set after creating the appsync grapghq"
}

variable "app_url" {
  type = string
  description = "Domain name such as www.mysite.com"
}

resource "aws_s3_object" "GeneralLambdaSourceCode" {
  bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
  key    = "contentpub-lambdas-1.0-SNAPSHOT.jar"
  source = "contentpub-lambdas-1.0-SNAPSHOT.jar" # its mean it depended on zip
}

resource "aws_lambda_function" "S3PresignerLambda" {
  description = "S3 presigner lambda for uploads"
  function_name = "s3PresignerFunction"
  handler = "io.contentpub.stripe.AwsOperationsHandler::handleRequest"
  architectures = [
    "x86_64"
  ]
  s3_bucket = aws_s3_bucket.LambdaFunctionsStaging.bucket
  s3_key = aws_s3_object.GeneralLambdaSourceCode.key
  memory_size = 256
  role = aws_iam_role.S3PreSignerLambdaIamRole.arn
  runtime = "java11"
  timeout = 20

  environment {
    variables = {
      aws_region = var.aws_region
      appsync_api_id = var.appsync_api_id
      JAVA_TOOL_OPTIONS = "-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
    }
  }

  tracing_config {
    mode = "PassThrough"
  }
}

resource "aws_lambda_permission" "S3PresignerPermission" {
  action = "lambda:InvokeFunction"
  function_name = "s3PresignerFunction"
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.ApiGatewayRestApi.id}/*"
}

resource "aws_iam_policy" "s3PresignerPolicy" {
  name = "s3PresignerPolicy"
  policy = templatefile("s3-policy-presign.json", { projectname = var.project_name })
}
