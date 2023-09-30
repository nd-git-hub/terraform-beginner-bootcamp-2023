resource "aws_s3_bucket" "s3-bucket-tf-bcmp" {
  bucket = random_string.bucket_name.result
}