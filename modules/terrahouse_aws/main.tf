terraform {

#   cloud {
#     organization = "Gaddereva"

#     workspaces {
#       name = "terra_house_1"
#     }
#   }
  required_providers {
    
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# provider "aws" {
#   # Configuration options
# }

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
   UserUuid = var.user_uuid
  }
}






