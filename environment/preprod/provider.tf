terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-DEV"
    storage_account_name = "sgdev12"
    container_name       = "tfstate"
    key                  = "preprod.tfstate"

  }

}
provider "azurerm" {
  subscription_id = "67f3a31e-83d6-4c1e-95f0-2f64212b3f96"
  features {}

}