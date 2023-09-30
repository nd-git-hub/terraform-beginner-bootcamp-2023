output "bucket_name" {
  value = aws_s3_bucket.s3-bucket-tf-bcmp.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "s3_bucket_object" {
  value = aws_s3_object.index.key
}