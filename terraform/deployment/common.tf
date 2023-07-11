variable "project_name" {
  type        = string
  description = "Project name. Your files and AWS components will be structured relative to this base name. It can be your domain name such as x.com or your project name that can be unique across all AWS"
}


variable "app_local_folder" {
  type        = string
  description = "Point to the root of app (contentpub_client) folder"
}

module "file_extensions" {
  source  = "reifnir/mime-map/null"
}

locals{
  mime_types = module.file_extensions.mappings
}

variable "aws_profile" {
   type = string
   description = "AWS profile"
 }

 variable "aws_region" {
   type = string
   description = "AWS region"
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