terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
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
 access_key = ""
 secret_key = ""
}

#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html 


resource "random_string" "bucket_name" {
  length           = 12
  special          = false
  upper = false 
  }

output "Random_backet_name" {
  value = random_string.bucket_name.result
}

resource "aws_s3_bucket" "s3-bucket-tf-bcmp" {
  bucket = random_string.bucket_name.result
}