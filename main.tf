terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 12
  special          = false
 }

output "Random_backet_name" {
  value = random_string.bucket_name.result
}
