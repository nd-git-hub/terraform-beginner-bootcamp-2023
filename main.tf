terraform {
#  cloud {
#    organization = "ndterra"
#
#    workspaces {
#      name = "terrahouse-cloud"
#    }
#  }
  required_providers {
#    random = {
#      source = "hashicorp/random"
#      version = "3.5.1"
#    }
        terratowns = {
          source = "local.providers/local/terratowns"
          version = "1.0.0"
        }


    #     aws = {
    #   source = "hashicorp/aws"
    #   version = "5.17.0"
    # }
  }
}


provider "terratowns" {
  endpoint = "http://localhost:4567"
  user_uuid="447ae4bf-7399-4767-ae27-089bb6e8473a" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}
# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.user_uuid
#   bucket_name = var.bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   content_version = var.content_version
#   assets_path = var.assets_path
# }