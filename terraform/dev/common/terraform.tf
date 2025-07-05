terraform {
  backend "azurerm" {
    resource_group_name  = "RG-ProjectDemo-Dev"
    storage_account_name = "projectdemostorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"

    }
  }
}
