
provider "aws" {
  # Configuration options
 region = "us-east-1"
 access_key = var.access_key
 secret_key = var.secret_key
 token = var.token
 }

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}