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
