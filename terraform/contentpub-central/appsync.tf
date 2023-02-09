resource "aws_appsync_graphql_api" "AppSyncGraphQLApi" {
    name = "${var.base_bucket_name}-staging"
    authentication_type = "API_KEY"

     schema = templatefile("schema.graphql", {
     aws_region = data.aws_region.current.name
     account_id = data.aws_caller_identity.current.account_id
  })

}

resource "aws_appsync_api_key" "AppSyncApiKey" {
    description = "api key description"
   
    api_id = aws_appsync_graphql_api.AppSyncGraphQLApi.id
}

