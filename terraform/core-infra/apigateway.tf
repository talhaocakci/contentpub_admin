data "aws_region" "current" {}

resource "aws_api_gateway_rest_api" "ApiGatewayRestApi" {
  name = "${var.project_name}-api"
  body = templatefile("openapi.json", {
     aws_region = data.aws_region.current.name
     aws_account = data.aws_caller_identity.current.account_id
  })
}

resource "aws_api_gateway_authorizer" "ApiGatewayAuthorizer" {
    rest_api_id = aws_api_gateway_rest_api.ApiGatewayRestApi.id
    name = "${var.project_name}-EndUserAuthorizer"
    type = "COGNITO_USER_POOLS"
    provider_arns = [
        "${aws_cognito_user_pool.ContentPubUserPool.arn}"
    ]
    identity_source = "method.request.header.Authorization"
}

resource "aws_api_gateway_deployment" "ApiStageDeployment" {
  rest_api_id = aws_api_gateway_rest_api.ApiGatewayRestApi.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.ApiGatewayRestApi.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_deployment" "ApiProductionDeployment" {
  rest_api_id = aws_api_gateway_rest_api.ApiGatewayRestApi.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.ApiGatewayRestApi.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "ApiStagingStage" {
  deployment_id = aws_api_gateway_deployment.ApiStageDeployment.id
  rest_api_id   = aws_api_gateway_rest_api.ApiGatewayRestApi.id
  stage_name    = "staging"
}

resource "aws_api_gateway_stage" "ApiProductionStage" {
  deployment_id = aws_api_gateway_deployment.ApiProductionDeployment.id
  rest_api_id   = aws_api_gateway_rest_api.ApiGatewayRestApi.id
  stage_name    = "production"
}


output "api_gateway_id" {
  value = aws_api_gateway_rest_api.ApiGatewayRestApi.id
}



