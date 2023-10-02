output "bucket_name" {
  value = aws_s3_bucket.s3-bucket-tf-bcmp.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "s3_bucket_object" {
  value = aws_s3_object.index.key
}



output "origin_access_control_name" {
  value = aws_cloudfront_origin_access_control.origin-access-cntrl.name
}

output "website_domain" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}