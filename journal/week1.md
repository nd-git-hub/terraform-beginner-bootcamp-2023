# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

- You can provide the file path with `--var-file` flag 

### terraform.tvfars

terraform.tfvars: Contains variable values assigned to the variables defined in variables.tf.
variables.tf: Contains variable declarations, specifying the variables to be used in the Terraform configuration.

### auto.tfvars

- auto.tfvars is another file that Terraform can use to automatically load variable values. It functions similarly to terraform.tfvars, but with one key difference: auto.tfvars is automatically loaded by Terraform without requiring any explicit action from the user.

### order of terraform variables

- variable.tf > terraform.tfvars > auto.tfvars > Command Line (-var option)

```
In this case we have declared variables in viariable.tf file and exported vaules on terminal as below. 

export TF_VAR_access_key="YOUR_ACCESS_KEY"
export TF_VAR_secret_key="YOUR_SECRET_KEY"
export TF_VAR_token="YOUR_SESSION_TOKEN"

```