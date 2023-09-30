
resource "random_string" "bucket_name" {
  length           = 12
  special          = false
  upper = false 
  }

output "Random_backet_name" {
  value = random_string.bucket_name.result
}

