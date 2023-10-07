terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

#provider "aws" {
  # Configuration options
# region = "us-east-1"
# access_key = var.access_key
# secret_key = var.secret_key
# token = var.token
# }

#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html 

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}

