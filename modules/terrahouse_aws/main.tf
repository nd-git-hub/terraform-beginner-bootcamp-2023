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
        aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
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

resource "aws_s3_bucket" "s3-bucket-tf-bcmp" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
  key    = "index.html" # Set the desired object key

  source = var.index_html_filepath # Path to the local index.html file
  etag = filemd5(var.index_html_filepath)
}
  resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
  key    = "error.html" # Set the desired object key

  source = var.error_html_filepath # Path to the local error.html file
  etag = filemd5(var.error_html_filepath)
}
