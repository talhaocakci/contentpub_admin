resource "aws_amplify_app" "ContentPubAmplify" {
  name = "${var.base_bucket_name}"
}

resource "aws_amplify_backend_environment" "ContentPubAmplifyBackendStaging" {
  app_id           = aws_amplify_app.ContentPubAmplify.id
  environment_name = "staging"

  deployment_artifacts = "${var.base_bucket_name}-backend-staging-deployment"
  stack_name           = "${var.base_bucket_name}-backend-staging"
}

resource "aws_amplify_backend_environment" "ContentPubAmplifyBackendProduction" {
  app_id           = aws_amplify_app.ContentPubAmplify.id
  environment_name = "production"

  deployment_artifacts = "${var.base_bucket_name}-backend-production-deployment"
  stack_name           = "${var.base_bucket_name}-production-staging"
}

output "amplify_backend_staging_id" {
  value = aws_amplify_backend_environment.ContentPubAmplifyBackendStaging.id
}

output "amplify_backend_production_id" {
  value = aws_amplify_backend_environment.ContentPubAmplifyBackendProduction.id
}