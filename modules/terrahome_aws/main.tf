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

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}


  


# provider "aws" {
#   # Configuration options
# }

# resource "aws_s3_bucket" "website_bucket" {
#   bucket = var.bucket_name

#   tags = {
#    UserUuid = var.user_uuid
#   }
# }
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
# resource "aws_s3_bucket_website_configuration" "website_configuration" {
#   bucket = aws_s3_bucket.website_bucket.bucket
#   index_document {
#     suffix = "index.html"
#   }
#   error_document {
#     key = "error.html"
#   }
 
    

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
# resource "aws_s3_object" "index_html" {
#   bucket = aws_s3_bucket.website_bucket.bucket
#   key    = "index.html"
#   source = var.index_html_filepath
#   etag = filemd5(var.index_html_filepath)
# }  

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
# resource "aws_s3_object" "error_html" {
#   bucket = aws_s3_bucket.website_bucket.bucket
#   key    = "error.html"
#   source = var.error_html_filepath

#   etag = filemd5(var.error_html_filepath)
# }



