terraform {
 cloud {
   organization = "ndterra"

   workspaces {
     name = "terra-house-1"
   }
 }
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

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}


resource "terratowns_home" "home" {
  name = "Lets Go Green, Join EV program !"
  description = <<DESCRIPTION
Take your climate action to the next level.

The scientific evidence is clear and irrefutable — human activity is causing our planet to warm at an 
alarming rate. International bodies of scientists have warned that we have just over a decade to halve our emissions to avoid the most devastating impacts of climate change on our food supply, 
national security, global health, extreme weather, and more.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.website_domain
  #domain_name = "3fdq3gzaa.cloudfront.net"
  town = "the-nomad-pad"
  content_version = var.arcanum.content_version
}



module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Making your Payday Bar"
  description = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could my own Paydays bars,
and if they are most cost effective.
DESCRIPTION
  domain_name = module.home_payday_hosting.website_domain
  town = "the-nomad-pad"
  content_version = var.payday.content_version
}