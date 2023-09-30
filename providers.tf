terraform {
#  cloud {
#    organization = "ndterra"
#
#    workspaces {
#      name = "terra-house-1"
#    }
#  }
  required_providers {
#    random = {
#      source = "hashicorp/random"
#      version = "3.5.1"
#    }
        aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
 region = "us-east-1"
 access_key = var.access_key
 secret_key = var.secret_key
 token = var.token
 }

#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html 
