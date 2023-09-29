# Terraform Beginner Bootcamp 2023
  * [Sementic versioning](#sementic-versioning)
  * [Install terraform CLI](#install-terraform-cli)
  * [ADD PROJECT_ROOT env variable](#add-project-root-env-variable)
  * [Correct aws cli install step on .gitpod.yml](#correct-aws-cli-install-step-on-gitpodyml)
  * [Add terraform random module](#add-terraform-random-module)
  * [Crate s3 bucket via terraform](#crate-s3-bucket-via-terraform)
  * [Terraform login and state file migration](#terraform-login-and-state-file-migration)
  * [Crate static website using S3](#crate-static-website-using-s3)

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
## Crate static website using S3
[bootcamp link] {https://www.youtube.com/watch?v=qIe3srQOQ8Q}
- Create folder and change properties to static 
- add index.html and error.html files to code 
- copy command to upload to s3
```
aws s3 cp public/index.html s3
://terraform-bootcamp-2023-nd/index.html 
upload: public/index.html to s3://terraform-bootcamp-2023-nd/index.html
```
- to verify how the code look like, you install http server
```
npm install http-server -g
http-server
```
- outputs as below, click on loaclhost and ensure it shows up page 
*Available on:
  http://127.0.0.1:8080
  http://10.0.5.2:8080
Hit CTRL-C to stop the server * 

https://8080-ndgithub-terraformbegin-5x1c2nop0hn.ws-us104.gitpod.io

- create cloudfront distribution (CDN) 
-- Instead of providing full public access on the bucket, it is recommened to create CDN and host as a website. This make the folder hosting more secure and provide addtional features as well. 
> Configure OAI 
 the "Origin Access Policy" (or "Origin Access Identity") in CloudFront helps secure your origin (bucket or website) by allowing CloudFront to access it while restricting direct access to the origin from the public.
 access path : user > cloudfront > OAI > origin 
 > Using an Origin Access Identity (OAI):Improved Security,Granular Access Control, Easier Configuration
 > Not Using an Origin Access Identity (OAI): Publicly Accessible Origin, Complex Permissions


<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

