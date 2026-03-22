terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }

  }

  cloud { 
    
    organization = "Guruswag143" 

    workspaces { 
      name = "terraformCI" 
    } 
  } 
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform123_rg"
  location = "East Asia"
}

resource "azurerm_storage_account" "storage" {
  name                     = "gurustorage0po90"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

