terraform {

#   cloud {
#     organization = "Gaddereva"

#     workspaces {
#       name = "terra_house_1"
#     }
#   }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}


provider "aws" {
  # Configuration options
}