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


    #    aws = {
    #    source = "hashicorp/aws"
    #    version = "5.17.0"
    #  }
  }
}

provider "aws" {
 #Configuration options
 region = "us-east-1"
 access_key = var.access_key
 secret_key = var.secret_key
 token = var.token
}


provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
#  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
  }

resource "terratowns_home" "home" {
  name = "Lets Go Green, Join EV program !"
  description = <<DESCRIPTION
Take your climate action to the next level.

The scientific evidence is clear and irrefutable — human activity is causing our planet to warm at an 
alarming rate. International bodies of scientists have warned that we have just over a decade to halve our emissions to avoid the most devastating impacts of climate change on our food supply, 
national security, global health, extreme weather, and more.
DESCRIPTION
  domain_name = module.terrahouse_aws.website_domain
  #domain_name = "3fdq3gzaa.cloudfront.net"
  town = "missingo"
  content_version = 1
}