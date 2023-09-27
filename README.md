# Terraform Beginner Bootcamp 2023

## Sementic versioning 

This project is going utilize sementic versiong for its tagging 
[semver.org] (https://semver.org/)

General format : 
 ** MAJOR.MINOR.PATCH, **  i.e 1.0.1 

- ** MAJOR **  version when you make incompatible API changes
- ** MINOR ** version when you add functionality in a backward compatible manner
- ** PATCH **  version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install terraform CLI 
Issue found in .gitpod.yml terraform install step. 
Script has been added into yml file with terraform install steps 


[terraform installation reference ] (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## ADD PROJECT_ROOT env variable 
- PROJECT_ROOT now can take to directory to bootcamp base reposisitory folder 
In order to make ** persistant ** change on all gitpod sessions run below once 
gp env PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'

## Correct aws cli install step on .gitpod.yml 
- Created new script aws_cli_install with cli installation steps and updated the script in .gitpod.yml

## Add terraform random module 
- add code for terraform random provider to generate folder name 
- run terraform phases init,plan,validate,apply to test terraform 
- terraform state and other files are skipped from backing up to git via .gitingnore 
- refer below block for random block
``` 
resource "random_string" "bucket_name" {
  length           = 12
  special          = false
 }

output "Random_backet_name" {
  value = random_string.bucket_name.result
}
```
[Terraform registry] (https://registry.terraform.io/browse/modules)
(https://registry.terraform.io/providers/hashicorp/random/latest)

## Crate s3 bucket via terraform 
- update main.tf file with aws provider and bucket block 
- you can have multiple providers in one main.tf file
- run terraform init to intialize the provider 
- check if access-key and access-key-id is define correctly 
```
make sure you set below values from your aws account 
export AWS_ACCESS_KEY_ID==
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=


export AWS_ACCESS_KEY_ID==
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=

aws sts get-caller-identity
```
[S3 bucket naming rules] (https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)

 ** Copy state file to s3 folder **
```
aws s3 cp terraform.tfstate s3://f89n5ilhw86j

```

## Terraform login and state file migration 
- This step will migrate the local terraform state file to terraform cloud 
- Genetea terraform token and copy to  /home/gitpod/.terraform.d/credentials.tfrc.json via process `terraform login`
- copy below block to main.tf prior to provider block, this will make terraform ready for init 
```sh
  cloud {
    organization = "ndterra"

    workspaces {
      name = "terra-house-1"
    }
  }
``` 
