terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}



resource "aws_secretsmanager_secret" "SecretsManagerSecret" {
    name = "stripe-secret"
    
}

resource "aws_secretsmanager_secret_version" "SecretsManagerSecretVersion" {
    secret_id = "arn:aws:secretsmanager:us-east-1:348467063208:secret:stripe-secret-dg5TMH"
}
