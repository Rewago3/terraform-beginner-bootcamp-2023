# Terraform Beginner Bootcamp 2023 -week 1

## Root Module Structure
Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf              # everything else
├── variables.tf         # stores the structure of input variables
├── terraform.tfvars     # the data of variables we want to load into our terraform project
├── outputs.tf           # stores our outputs
├── providers.tf         # defines required providers and their configurations
└── README.md            # required for root modules
```
  
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In Terraform we can set two kinds of variables
- Environment Variables - those that you will set in your bash terminal eg. AWS credentials
- Terraform Variables - those taht you will normally set in your tfvars file
We can set Terraform cloud variables to be sensitive so that they are not shown visisblly in the UI.

### Loading Terraform Input Variables
[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
#### var flag
We can use the `var` flag to set the input variable or override a variable in the tfvars file eg. `terraform -var user__id="my_user_id"`
#### var-file flag
- TODO
#### terraform.tfvars
This is the default file to load terraform variables in bulk.
#### auto.tfvars
- TODO
#### Order of Terraform variables
- TODO documenet which terraform variables take precedence

## Dealing with configuration drift
## What happens if we lose our state file
If we lose our statefile you like have to tear down your cloud infastructure manually.
You can use terraform import, but it won't wok for all cloud resources. You need to check the terraform provider's documentation for which resources support import.

### Fix missing resources with Terraform Import
`terraform import aws_s3_bucket.bucket_name`
[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)
### Fix Manual Configuration
If someone goes and deletes or modifies cloud resources manually, through Clickops.
If we run `terraform plan' it will attempt to put our infrastructure back into expected state fixing configuration drift

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```
### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```


[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform
### Fileexists function

This is a built in terraform function to check the existance of a file.

```tf
condition = fileexists(var.error_html_filepath)
```

https://developer.hashicorp.com/terraform/language/functions/fileexists

### Filemd5

https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module
[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)


resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}