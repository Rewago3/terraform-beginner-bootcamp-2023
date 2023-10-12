terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

#backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Gaddereva"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  
    cloud {
    organization = "Gaddereva"

    workspaces {
      name = "terra_house_1"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid=  var.teacherseat_user_uuid
  token=var.terratowns_access_token
}
# module "terrahouse_aws" {
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.teacherseat_user_uuid
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   assets_path = var.assets_path
#   content_version = var.content_version
# }
module "home_nomadpads_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.nomadpads.public_path
  content_version = var.nomadpads.content_version
}

resource "terratowns_home" "home" {
  name = "Testing for Missingo"
  description = <<DESCRIPTION
Humanitarian and emergency aid are justified, but the government must be diligent about
ensuring the money ends up in the right places, an official with a Canadian Jewish group.
DESCRIPTION
  domain_name = module.home_nomadpads_hosting.domain_name
  #domain_name = "3fdq3gz123.cloudfront.net"
  town = "missingo"
  content_version = var.nomadpads.content_version
}


module "home_desifoods_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.desifoods.public_path
  content_version = var.desifoods.content_version
}

resource "terratowns_home" "home_desifood" {
  name = "Dosa Recipe"
  description = <<DESCRIPTION
Since I really like Dosa, here is a recipe of how to make dosa from scratch.
DESCRIPTION
  domain_name = module.home_desifoods_hosting.domain_name
  town = "missingo"
  content_version = var.desifoods.content_version
}
