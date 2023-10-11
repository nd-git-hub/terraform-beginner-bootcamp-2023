
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

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
  key    = "index.html" # Set the desired object key
  content_type = "text/html"
  source = var.index_html_filepath # Path to the local index.html file
  etag = filemd5(var.index_html_filepath)
}

resource "aws_s3_object" "asset_upload" {
 for_each = fileset(var.assets_path,"*.{jpg,webp,png,gif}")
 bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
 key    = "assets/${each.key}" # Set the desired object key
   source = "${var.assets_path}/${each.key}" # Path to the local asset_upload.html file
 etag = filemd5("${var.assets_path}/${each.key}")
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


  resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.s3-bucket-tf-bcmp.bucket  
  key    = "error.html" # Set the desired object key
  content_type = "text/html"
  source = var.error_html_filepath # Path to the local error.html file
  etag = filemd5(var.error_html_filepath)
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