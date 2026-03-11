terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cpp-resources"
    storage_account_name = "cppstorageaccount250321"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
}

module "static_website" {
  source                 = "./modules/static_website"
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  sa_name                = var.sa_name
  tfstate_container_name = var.tfstate_container_name
}