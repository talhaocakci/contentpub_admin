data "aws_region" "current" {}

resource "aws_api_gateway_rest_api" "ApiGatewayRestApi" {
  name = "${var.project_name}-api"
  body = templatefile("openapi.json", {
     aws_region = data.aws_region.current.name
     aws_account = data.aws_caller_identity.current.account_id
     user_pool_id = aws_cognito_user_pool.ContentPubUserPool.id
     project_name = var.project_name
  })
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



