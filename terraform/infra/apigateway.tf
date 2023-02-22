data "aws_region" "current" {}


resource "aws_api_gateway_rest_api" "ApiGatewayRestApi" {
  name = "${var.project_name}-api"
  body = templatefile("openapi.json", {
     aws_region = data.aws_region.current.name
     account_id = data.aws_caller_identity.current.account_id
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


output "api_gateway_id" {
  value = aws_api_gateway_rest_api.ApiGatewayRestApi.id
}



