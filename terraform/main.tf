terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  # WICHTIG: Diesen Block erst NACH dem initialen "terraform apply" aktivieren!
  # Dann "terraform init -migrate-state" ausführen

  backend "azurerm" {
    resource_group_name  = "cpp-resources"
    storage_account_name = "cppstorageaccount250321"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }

}

# Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id wird aus Umgebungsvariable ARM_SUBSCRIPTION_ID gelesen
}

# Ressourcengruppe
resource "azurerm_resource_group" "cpp_rg" {
  name     = var.rg_name
  location = var.location
}

# Storage Account für Website UND Terraform State
resource "azurerm_storage_account" "cpp_sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.cpp_rg.name
  location                 = azurerm_resource_group.cpp_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS" # LRS statt GRS für Students (günstiger)

  # Aktiviert die statische Website
  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

# Container für Terraform State
resource "azurerm_storage_container" "tfstate" {
  name                  = var.tfstate_container_name
  storage_account_name  = azurerm_storage_account.cpp_sa.name
  container_access_type = "private"
}

# Blob für index.html
resource "azurerm_storage_blob" "cpp_blob_index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.cpp_sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/index.html"
  content_type           = "text/html"
}

# Blob für 404.html
resource "azurerm_storage_blob" "cpp_blob_error" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.cpp_sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/404.html"
  content_type           = "text/html"
}