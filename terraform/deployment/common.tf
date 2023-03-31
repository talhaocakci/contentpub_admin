variable "project_name" {
  type        = string
  description = "Project name. Your files and AWS components will be structured relative to this base name. It can be your domain name such as x.com or your project name that can be unique across all AWS"
}


module "file_extensions" {
  source  = "reifnir/mime-map/null"
}

locals{
  mime_types = module.file_extensions.mappings
}