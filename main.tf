terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint//"https://terratowns.cloud/api"
  user_uuid=  var.teacherseat_user_uuid
  token=var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  #bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}

resource "terratowns_home" "home" {
  name = "Testing for Missingo"
  description = <<DESCRIPTION
Humanitarian and emergency aid are justified, but the government must be diligent about
ensuring the money ends up in the right places, an official with a Canadian Jewish group.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz123.cloudfront.net"
  town = "missingo"
  content_version = 1
}
