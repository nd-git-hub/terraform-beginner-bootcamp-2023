- output from last change..

- [] terraform apply

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

bucket_name = "ubeppz5bay5i-bcmp"
s3_object_name = "index.html"
s3_website_endpoint = "ubeppz5bay5i-bcmp.s3-website-us-east-1.amazonaws.com"


## Terrahome AWS

```tf
module "home_payday" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday_public_path
  content_version = var.content_version
}
```

THe public directory expects the following:
- index.html
- error.html
- assets

ALl top level files in assets will be copied, but not any subdirectories.