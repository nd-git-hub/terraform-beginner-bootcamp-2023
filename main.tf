

resource "aws_s3_bucket" "s3-bucket-tf-bcmp" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}