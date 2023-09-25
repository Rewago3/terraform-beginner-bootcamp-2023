# Terraform Beginner Bootcamp 2023

## Semantic Versioning `:mage:`

This project is going to use semantic versioning for tagging.
[semver.org](https://semver.org/)

Given a version number **MAJOR.MINOR.PATCH**, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the Terraform CLI

### Connsiderations with the Terraform CLI changes
The Terraform installation instructions have changed due to gpg key ring changes. So referred to the latest Install CLI instructions via Terraform documentation and chage the scripts for install.
[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distributions
This project is built against Ubuntu. Please consider checking your Linux distribution and change code accordingly.
[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)
Example of checking os version:

```sh
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into bash scripts
While fixing the Terraform CLI deprecation issues, the bash scripts were a considerable amount to code, so decided to create a bash script to install the terrraform cli.
The bash script is located here:[./bin/install_terraform_cli](./bin/install_terraform_cli)
- This will keep the gitpod task file([.gitpod.yml](.gitpod.yml)) tidy.
- This allows us an easier time to debug and execute manually Terraform CLI install.
- This will allow better potability for other projects that need to install Terraform CLI.

#### Shebang
A Shebang (pronounced Sha-bang) tells the bash script what program will interpret the script. eg. `#!/bin/bash`
ChatGPT recommended we use this format for bash. `#!/usr/bin/env bash`
- for portability for different OS distributions
- will search the user's PATH for the executable   
https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations
When executing bash scripts we can use the `./` shorthand notation to execute the bash script
eg. `./bin/install_terraform_cli`
If we are using a script in gitpod.yml file, we need to point the script to a program to interpret it. 
eg. `source ./bin/install_terraform_cli`
#### Linux Permission Considerations

In order to make our bash scripts executable we need to change linux permissions for the file to be executable at the user mode.
```sh
chmod u+x ./bin/install_terraform_cli`
```

alternatively we can
```sh
chmod 744 ./bin/install_terraform_cli
```
https://en.wikipedia.org/wiki/Chmod

### GitHub Lifecycle(Before, Init,Command)
We need to be careful in using the Init, because it will not rerun if we start a existing workspace.
https://www.gitpod.io/docs/configure/workspaces/tasks

### Working with Env Vars
#### env command
We can list out all Environment Variables(Env Vars) using the `env` command.
We can filter out specific env var using grep eg. `env | grep AWS_`
#### Setting and Unsetting Env Vars
In the terminal we can set using `export HELLO=world`
In the terminal we can unset using `unset HELLO`

We can set an env var temporarly when just running a command
```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env var without writing export eg.
```sh
#!/usr/bin/env bash
HELLO='world'
echo $HELLO
```

#### Printing Vars
We can print an env var using echo eg. `echo $HELLO`

### Scoping of Env Vars
When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another terminal.
If you want env vars to persist across all future bash terminals that are open you need to set env vars in your bash profile eg. `.bash_profile`
#### Persisiting Env Vars in Gitpod

We can persist env vars in gitpod by storing them in Gitpod's Secrets Storage
```sh
gp env HELLO='world'
```
All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.
You can also set env vars in the `.gitpod.yml`, but this can contain oly non-sensitive env vars.
### AWS CLI installation
AWS CLI is nstalled for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)
[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command.
```sh
aws sts get-caller-identity
```
If it is successful you shouls see a json payload return that looks like this:
```json
{
    "UserId": "DIDARA3MJJKYOJQGPOWER",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/test-b-bootcamp"
}

```
We will need to generate AWS Credentials from AWS IAM user in order to the user AWS CLI


## Terraform Basics
### Terraform Registry

Terrraform sources their providers and modules from the Terrraform Registry which is located at [registry.terraform.io](https://registry.terraform.io/)
[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)
- **Providers** are interfaces to API's that allows you to create resources in Terraform.
- **Modules** are a way to make large amounts of terraform code modular, portable and sharable.

### Terraform Console
We can see a list of all Terraform commands by simply typing `terraform`.

#### Terraform Init
`terraform init`
At the start of a new terraform project we will run terrraform init to download the binaries for the terraform providers that we will use in this project.
#### Terraform Plan
`terraform plan`
This will generate out a changeset about the change of our infrastructure and what will be changed.
We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.
#### Terraform Apply
`terraform apply`
This will run a plan and pass the changeset to be executed by terraform. Apply should prompt us "yes or no"
If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`
#### Terraform Destroy
`terrraform destroy`
This will destroy resources.

#### Terraform Lock Files
`terraform.lock.hcl` contains the locked versions of providers or modules that should be used with this project.
The terraform lock file **should be commited** to version control system(VCS). eg. Github

#### Terraform State Files
`terraform.tfstate` contains information about he current state of your infrastructure. 
This file **should not be commited** to your VCS.
This file contains sensitive data. If you lse ths file you lose knowing the state of your infrastructure.
`terraform.tfstate.backup` is the prvious state file.

### Terraform Directory ie.(Folder)
`.terraform` contains binaries of terraform providers 





