
resource "aws_s3_bucket" "s3-bucket-tf-bcmp" {
 # we want to assign a random bucket name
  #bucket = var.bucket_name

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


resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
  key    = "index.html"
  source = "${var.public_path}/index.html"
  content_type = "text/html"

  etag = filemd5("${var.public_path}/index.html")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}


resource "aws_s3_object" "upload_assets" {
  for_each = fileset("${var.public_path}/assets","*.{jpg,webp,png,gif}")
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket 
  key    = "assets/${each.key}"
  source = "${var.public_path}/assets/${each.key}"
  etag = filemd5("${var.public_path}/assets/${each.key}")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}


# resource "aws_s3_object" "asset_upload" {
#   for_each = fileset("${path.root}/public/assets","*.{jpg,webp,png,gif}")
#   bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
#   key    = "asstes/${each.key}" # Set the desired object key
#   source = "${path.root}/public/assets/${each.key}" # Path to the local asset_upload.html file
#   etag = filemd5("${path.root}/public/assets/${each.key}")
#     lifecycle {
#     replace_triggered_by = [terraform_data.content_version.output]
#     ignore_changes = [etag]
#   }
# }


resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket
  key    = "error.html"
  source = "${var.public_path}/error.html"
  content_type = "text/html"

  etag = filemd5("${var.public_path}/error.html")
  #lifecycle {
  #  ignore_changes = [etag]
  #}
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = {
      "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
      "Effect" = "Allow",
      "Principal" = {
        "Service" = "cloudfront.amazonaws.com"
      },
      "Action" = "s3:GetObject",
      "Resource" = "arn:aws:s3:::${aws_s3_bucket.s3-bucket-tf-bcmp.id}/*",
      "Condition" = {
      "StringEquals" = {
          #"AWS:SourceArn": data.aws_caller_identity.current.arn
          "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
        }
      }
    }
  })
}

resource "terraform_data" "content_version" {
  input = var.content_version
}