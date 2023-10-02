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
